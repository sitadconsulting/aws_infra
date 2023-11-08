Content-Type: multipart/mixed; boundary="==MYBOUNDARY=="

MIME-Version: 1.0

--==MYBOUNDARY==
Content-Type: text/x-shellscript; charset="us-ascii"

#!/bin/bash -xe

MSK_KAFKA_VERSION="3.4.0"
KAFKA_CONF_PATH="/etc/kafka"
KAFKA_LOG_DIR="/var/log/kafka"
KAFKA_HOME_DIR="/opt/apps/kafka"
KAFKA_DOWNLOAD_DIR="/opt/apps/kafka/downloads"
KAFKA_PLUGIN_DIR="/opt/apps/kafka/plugin"
EC2_USER_HOME_DIR="/home/ec2-user"
SOFTWARE_DOWNLOAD_DIR='/home/ec2-user/download'
SCRIPT_DIR="/home/ec2-user/scripts"
DEVELOPER_HOME_DIR="/home/developer"
DBA_HOME_DIR="/home/dba"

sudo yum -y update

sudo yum -y install python3.9
sudo yum -y install java-11
sudo yum -y install git 
sudo yum -y erase awscli 
sudo yum -y install jq 

# populate bash profile 
sudo echo "export SOFTWARE_DOWNLOAD_DIR=$SOFTWARE_DOWNLOAD_DIR" | tee -a /root/.bash_profile
sudo echo "export EC2_USER_HOME_DIR=$EC2_USER_HOME_DIR" | tee -a /root/.bash_profile
sudo echo "export MSK_KAFKA_VERSION=$MSK_KAFKA_VERSION" | tee -a /root/.bash_profile
sudo echo "export KAFKA_CONF_PATH=$KAFKA_CONF_PATH" | tee -a /root/.bash_profile
sudo echo "export KAFKA_LOG_DIR=$KAFKA_LOG_DIR" | tee -a /root/.bash_profile
sudo echo "export KAFKA_HOME_DIR=$KAFKA_HOME_DIR" | tee -a /root/.bash_profile
sudo echo "export KAFKA_DOWNLOAD_DIR=$KAFKA_DOWNLOAD_DIR" | tee -a /root/.bash_profile
sudo echo "export KAFKA_PLUGIN_DIR=$KAFKA_PLUGIN_DIR" | tee -a /root/.bash_profile
sudo echo "export SCRIPT_DIR=$SCRIPT_DIR" | tee -a /root/.bash_profile
sudo echo "export DEVELOPER_HOME_DIR=$DEVELOPER_HOME_DIR" | tee -a /root/.bash_profile
sudo echo "export DBA_HOME_DIR=$DBA_HOME_DIR" | tee -a /root/.bash_profile


# Create users 
sudo useradd -c "kafka user" -d $KAFKA_HOME_DIR -s /bin/bash -m -r kafka
sudo useradd -c "dev user 1" -b $DEVELOPER_HOME_DIR -s /bin/bash  devuser01
sudo useradd -c "dba user 1" -b $DBA_HOME_DIR -s /bin/bash  dbauser01

sudo chown -R kafka:kafka  $KAFKA_HOME_DIR
sudo chown -R devuser01:devuser01 $DEVELOPER_HOME_DIR/devuser01
sudo chown -R dbauser01:dbauser01 $DBA_HOME_DIR/dbauser01

# Modify sudoer file
sudo cp /etc/sudoers /etc/sudoers.orig
sudo sed -i  "/root\t/a\kafka\tALL = NOPASSWD: /usr/bin/su" /etc/sudoers
sudo sed -i  "/kafka\t/a\devuser01\tALL = NOPASSWD: /usr/bin/su" /etc/sudoers
sudo sed -i  "/devuser01\t/a\dbauser01\tALL = NOPASSWD: /usr/bin/su" /etc/sudoers

# Create required directories
sudo mkdir -p $SOFTWARE_DOWNLOAD_DIR
sudo mkdir -p $SCRIPT_DIR
sudo mkdir -p /tmp/kafka
sudo mkdir -p $DBA_HOME_DIR/dbauser01/scripts

sudo mkdir -p $KAFKA_HOME_DIR/utilities
sudo mkdir -p $KAFKA_CONF_PATH
sudo mkdir -p $KAFKA_LOG_DIR
sudo mkdir -p $KAFKA_DOWNLOAD_DIR
sudo mkdir -p $KAFKA_PLUGIN_DIR
sudo mkdir -p $KAFKA_CONF_PATH/security/iam
sudo mkdir -p $KAFKA_CONF_PATH/security/ssl/tls
sudo mkdir -p $KAFKA_CONF_PATH/security/ssl/tls/truststore
sudo mkdir -p $KAFKA_CONF_PATH/security/ssl/tls/keystore
sudo mkdir -p $KAFKA_CONF_PATH/security/ssl/certificate
sudo mkdir -p $KAFKA_CONF_PATH/security/ssl/private_key

sudo chown -R ec2-user:ec2-user $SCRIPT_DIR
sudo chown -R ec2-user:ec2-user $SOFTWARE_DOWNLOAD_DIR
sudo chown -R ec2-user:ec2-user /tmp/kafka
sudo chown -R kafka:kafka $KAFKA_CONF_PATH
sudo chown -R kafka:kafka $KAFKA_LOG_DIR
sudo chown -R kafka:kafka $KAFKA_DOWNLOAD_DIR
sudo chown -R kafka:kafka $KAFKA_PLUGIN_DIR
sudo chown -R dbauser01:dbauser01 $DBA_HOME_DIR/dbauser01/scripts

# Download and install AWS CLI 
cd $SOFTWARE_DOWNLOAD_DIR

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip -d $EC2_USER_HOME_DIR
cd $EC2_USER_HOME_DIR
sudo su -c "./aws/install -i /usr/local/aws-cli -b /usr/local/bin" -s /usr/bin/sh

# Download and install Debezium connector for MySQL 
cd $SOFTWARE_DOWNLOAD_DIR
wget https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/2.3.4.Final/debezium-connector-mysql-2.3.4.Final-plugin.tar.gz
tar xzf debezium-connector-mysql-2.3.4.Final-plugin.tar.gz -C $KAFKA_PLUGIN_DIR
cd $KAFKA_PLUGIN_DIR
zip -r debezium-connector-mysql-2.3.4.Final-plugin.zip *
aws s3 cp debezium-connector-mysql-2.3.4.Final-plugin.zip s3://${kafka_connect_target_bucket}/debezium/

# Download and install Apache Kafka 
echo -n "
security.protocol=SASL_SSL
sasl.mechanism=AWS_MSK_IAM
sasl.jaas.config=software.amazon.msk.auth.iam.IAMLoginModule required;
sasl.client.callback.handler.class=software.amazon.msk.auth.iam.IAMClientCallbackHandler" > $KAFKA_CONF_PATH/security/iam/client.properties
chown -R kafka:kafka $KAFKA_CONF_PATH/security/iam/client.properties

echo -n "
BOOTSTRAP_SERVERS_CONFIG=${bootstrapserver_iam}" > $KAFKA_CONF_PATH/security/iam/producer.properties
chown -R kafka:kafka $KAFKA_CONF_PATH/security/iam/producer.properties

echo -n "
security.protocol=SSL
ssl.truststore.location=$KAFKA_CONF_PATH/security/ssl/tls/truststore/kafka.client.truststore.jks
ssl.keystore.location=$KAFKA_CONF_PATH/security/ssl/tls/keystore/kafka.client.keystore.jks
ssl.keystore.password=${ssl_keystore_password}
ssl.key.password=${ssl_key_password}
ssl.truststore.password=${trust_store_password}" > $KAFKA_CONF_PATH/security/ssl/tls/client.properties
chown -R kafka:kafka $KAFKA_CONF_PATH/security/ssl/tls/client.properties

echo -n "
BOOTSTRAP_SERVERS_CONFIG=${bootstrapserver_tls}
SSL_TRUSTSTORE_LOCATION_CONFIG=$KAFKA_CONF_PATH/security/ssl/tls/truststore/kafka.client.truststore.jks
SSL_KEYSTORE_LOCATION_CONFIG=$KAFKA_CONF_PATH/security/ssl/tls/keystore/kafka.client.keystore.jks
SSL_KEYSTORE_PASSWORD_CONFIG=${ssl_keystore_password}
SSL_KEY_PASSWORD_CONFIG=${ssl_key_password}" > $KAFKA_CONF_PATH/security/ssl/tls/producer.properties

chown -R kafka:kafka $KAFKA_CONF_PATH/security/ssl/tls/producer.properties

sudo echo "export MSK_BOOTSTRAP_ADDRESS=${bootstrapserver_tls}" | tee -a $KAFKA_HOME_DIR/.bash_profile
sudo echo "export MSK_BOOTSTRAP_IAM_ADDRESS=${bootstrapserver_iam}" | tee -a $KAFKA_HOME_DIR/.bash_profile
sudo echo "export RDS_AURORA_ENDPOINT=${rds_aurora_endpoint}" | tee -a $KAFKA_HOME_DIR/.bash_profile
sudo echo "export MSK_KAFKA_VERSION=$MSK_KAFKA_VERSION" | tee -a $KAFKA_HOME_DIR/.bash_profile
sudo echo "export KAFKA_CONF_PATH=$KAFKA_CONF_PATH" | tee -a $KAFKA_HOME_DIR/.bash_profile
sudo echo "export KAFKA_LOG_DIR=$KAFKA_LOG_DIR"  | tee -a $KAFKA_HOME_DIR/.bash_profile
sudo echo "export KAFKA_DOWNLOAD_DIR=$KAFKA_DOWNLOAD_DIR" | tee -a $KAFKA_HOME_DIR/.bash_profile
sudo echo "export KAFKA_HOME_DIR=$KAFKA_HOME_DIR" | tee -a $KAFKA_HOME_DIR/.bash_profile
sudo echo "export KAFKA_LIB_DIR=$KAFKA_HOME_DIR/kafka/libs" |  tee -a $KAFKA_HOME_DIR/.bash_profile
sudo echo "export CLASSPATH=$KAFKA_LIB_DIR/aws-msk-iam-auth-1.1.1-all.jar" | tee -a $KAFKA_HOME_DIR/.bash_profile

cd $KAFKA_DOWNLOAD_DIR

wget https://archive.apache.org/dist/kafka/$MSK_KAFKA_VERSION/kafka_2.13-$MSK_KAFKA_VERSION.tgz
tar xzf kafka_2.13-$MSK_KAFKA_VERSION.tgz --strip-components=1 -C $KAFKA_HOME_DIR

chown -R kafka:kafka $KAFKA_HOME_DIR
chown -R kafka:kafka $KAFKA_HOME_DIR/*

cd $KAFKA_HOME_DIR/libs
wget https://github.com/aws/aws-msk-iam-auth/releases/download/v1.1.1/aws-msk-iam-auth-1.1.1-all.jar

# Load the data into Aurora
cd $SOFTWARE_DOWNLOAD_DIR
sudo wget https://dev.mysql.com/get/mysql80-community-release-el9-3.noarch.rpm
sudo yum -y install mysql80-community-release-el9-3.noarch.rpm
sudo yum -y install mysql-community-server
sudo echo "export DBA_HOME_DIR=$DBA_HOME_DIR" | tee -a $DBA_HOME_DIR/dbauser01/.bash_profile
sudo su -c "aws s3 cp s3://${kafka_connect_target_bucket}/scripts/salesdb.sql $DBA_HOME_DIR/dbauser01/scripts/salesdb.sql" -l dbauser01
#sudo su -c "mysql -f -u master -h ${rds_aurora_endpoint}  --password=${database_password} < /home/ec2-user/scripts/salesdb.sql" -l ec2-user


# Install maven
cd $DEVELOPER_HOME_DIR/devuser01
wget https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.zip
unzip  apache-maven-3.9.5-bin.zip
ln -s apache-maven-3.9.5 apache-maven

# Clone, build and copy utilities
cd $DEVELOPER_HOME_DIR/devuser01
wget https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u312-b07/OpenJDK8U-jdk_x64_linux_hotspot_8u312b07.tar.gz
tar zxf OpenJDK8U-jdk_x64_linux_hotspot_8u312b07.tar.gz -C /usr/lib/jvm
update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk8u312-b07/bin/java" 1 --family java-8-openjdk.x86_64
update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk8u312-b07/bin/javac" 1 --family java-8-openjdk.x86_64
update-alternatives --set "java" "/usr/lib/jvm/jdk8u312-b07/bin/java"
update-alternatives --set "javac" "/usr/lib/jvm/jdk8u312-b07/bin/javac"
M2_HOME=$DEVELOPER_HOME_DIR/devuser01/apache-maven
sudo echo "export M2_HOME=$M2_HOME" | tee -a $DEVELOPER_HOME_DIR/devuser01/.bash_profile
sudo echo "export PATH=$M2_HOME/bin:$PATH" |  tee -a $DEVELOPER_HOME_DIR/devuser01/.bash_profile
sudo echo "export PATH=$M2_HOME/bin:$PATH" |  tee -a /root/.bash_profile
source  $DEVELOPER_HOME_DIR/devuser01/.bash_profile
chown -R devuser01:devuser01 $DEVELOPER_HOME_DIR/devuser01

git clone https://github.com/aws-samples/amazon-msk-client-authentication.git && cd amazon-msk-client-authentication
chown -R devuser01:devuser01 $DEVELOPER_HOME_DIR/devuser01/amazon-msk-client-authentication
chown -R devuser01:devuser01 $DEVELOPER_HOME_DIR/devuser01/amazon-msk-client-authentication/*
sudo su -c "mvn clean package -f amazon-msk-client-authentication/pom.xml" -l devuser01
cp target/AuthMSK-1.0-SNAPSHOT.jar $KAFKA_HOME_DIR/utilities
update-alternatives --auto "java"
update-alternatives --auto "javac"

# Download and install PIP
sudo echo "export SOFTWARE_DOWNLOAD_DIR=$SOFTWARE_DOWNLOAD_DIR" | tee -a $EC2_USER_HOME_DIR/.bash_profile
sudo echo "export EC2_USER_HOME_DIR=$EC2_USER_HOME_DIR" | tee -a $EC2_USER_HOME_DIR/.bash_profile
sudo echo "export SCRIPT_DIR=$SCRIPT_DIR" | tee -a $EC2_USER_HOME_DIR/.bash_profile

cd $SOFTWARE_DOWNLOAD_DIR

wget https://bootstrap.pypa.io/get-pip.py

sudo su -c "python3.9 get-pip.py --user" -s /usr/bin/sh ec2-user
sudo su -c "/home/ec2-user/.local/bin/pip3 install boto3 --user" -s /usr/bin/sh ec2-user
sudo su -c "/home/ec2-user/.local/bin/pip3 install kafka-python --user" -s /usr/bin/sh ec2-user

--==MYBOUNDARY==--\

