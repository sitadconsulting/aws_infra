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
OPENSEARCH_HOME_DIR="/opt/apps/opensearch"
DEVELOPER_HOME_DIR="/home/developer"

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
sudo echo "export OPENSEARCH_HOME_DIR=$OPENSEARCH_HOME_DIR" | tee -a /root/.bash_profile
sudo echo "export DEVELOPER_HOME_DIR=$DEVELOPER_HOME_DIR" | tee -a /root/.bash_profile


# Create users 
sudo mkdir -p  $DEVELOPER_HOME_DIR/devuser01
sudo useradd -c "kafka user" -d $KAFKA_HOME_DIR -s /bin/bash -m -r kafka
sudo useradd -c "opensearch user" -d $OPENSEARCH_HOME_DIR -s /bin/bash -m -r opensearch
sudo useradd -c "dev user 1" -b $DEVELOPER_HOME_DIR -s /bin/bash  devuser01

sudo chown -R kafka:kafka  $KAFKA_HOME_DIR
sudo chown -R opensearch:opensearch $OPENSEARCH_HOME_DIR
sudo cp /etc/skel/.* $DEVELOPER_HOME_DIR/devuser01
sudo chown -R devuser01:devuser01 $DEVELOPER_HOME_DIR/devuser01

# Modify sudoer file
sudo cp /etc/sudoers /etc/sudoers.orig
sudo sed -i  "/root\t/a\kafka\tALL = NOPASSWD: /usr/bin/su" /etc/sudoers
sudo sed -i  "/kafka\t/a\opensearch\tALL = NOPASSWD: /usr/bin/su" /etc/sudoers
sudo sed -i  "/opensearch\t/a\devuser01\tALL = NOPASSWD: /usr/bin/su" /etc/sudoers

# Create required directories
sudo mkdir -p $SOFTWARE_DOWNLOAD_DIR
sudo mkdir -p $SCRIPT_DIR
sudo mkdir -p /tmp/kafka

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
sudo mkdir -p $OPENSEARCH_HOME_DIR/scripts

sudo chown -R ec2-user:ec2-user $SCRIPT_DIR
sudo chown -R ec2-user:ec2-user $SOFTWARE_DOWNLOAD_DIR
sudo chown -R ec2-user:ec2-user /tmp/kafka
sudo chown -R kafka:kafka $KAFKA_CONF_PATH
sudo chown -R kafka:kafka $KAFKA_LOG_DIR
sudo chown -R kafka:kafka $KAFKA_DOWNLOAD_DIR
sudo chown -R kafka:kafka $KAFKA_PLUGIN_DIR
sudo chown -R opensearch:opensearch $OPENSEARCH_HOME_DIR/scripts

# Download and install AWS CLI 
cd $SOFTWARE_DOWNLOAD_DIR
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip -d $EC2_USER_HOME_DIR
cd $EC2_USER_HOME_DIR
sudo su -c "./aws/install -i /usr/local/aws-cli -b /usr/local/bin" -s /usr/bin/sh

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

# Download S3 artifacts
sudo su -c "aws s3 cp s3://${streaming_artifacts_bucket}/msk-lab-resources/departments_count.json $OPENSEARCH_HOME_DIR/scripts" -l opensearch
sudo su -c "aws s3 cp s3://${streaming_artifacts_bucket}/msk-lab-resources/user_session_counts.json $OPENSEARCH_HOME_DIR/scripts" -l opensearch
sudo su -c "aws s3 cp s3://${streaming_artifacts_bucket}/msk-lab-resources/user_session_details.json $OPENSEARCH_HOME_DIR/scripts" -l opensearch
sudo su -c "aws s3 cp s3://${streaming_artifacts_bucket}/msk-lab-resources/clickstream_dashboard.ndjson $OPENSEARCH_HOME_DIR/scripts" -l opensearch


# Install maven
sudo su - devuser01
pwd
cd $DEVELOPER_HOME_DIR/devuser01
wget https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.zip
unzip  apache-maven-3.9.5-bin.zip
ln -s apache-maven-3.9.5 apache-maven
M2_HOME=$DEVELOPER_HOME_DIR/devuser01/apache-maven
sudo echo "export M2_HOME=$M2_HOME" | tee -a $DEVELOPER_HOME_DIR/devuser01/.bash_profile
sudo echo "export PATH=$M2_HOME/bin:$PATH" |  tee -a $DEVELOPER_HOME_DIR/devuser01/.bash_profile
sudo echo "export PATH=$M2_HOME/bin:$PATH" |  tee -a /root/.bash_profile
source  /root/.bash_profile

# Clone, build and copy utilities
sudo su - devuser01
cd $DEVELOPER_HOME_DIR/devuser01
wget https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u312-b07/OpenJDK8U-jdk_x64_linux_hotspot_8u312b07.tar.gz
tar zxf OpenJDK8U-jdk_x64_linux_hotspot_8u312b07.tar.gz -C /usr/lib/jvm
update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk8u312-b07/bin/java" 1 --family java-8-openjdk.x86_64
update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk8u312-b07/bin/javac" 1 --family java-8-openjdk.x86_64
update-alternatives --set "java" "/usr/lib/jvm/jdk8u312-b07/bin/java"
update-alternatives --set "javac" "/usr/lib/jvm/jdk8u312-b07/bin/javac"

git clone https://github.com/aws-samples/amazon-msk-client-authentication.git && cd amazon-msk-client-authentication
mvn clean package -f pom.xml
cp target/AuthMSK-1.0-SNAPSHOT.jar $KAFKA_HOME_DIR/utilities
update-alternatives --auto "java"
update-alternatives --auto "javac"

cd $DEVELOPER_HOME_DIR/devuser01
git clone https://github.com/aws-samples/sasl-scram-secrets-manager-client-for-msk.git && cd sasl-scram-secrets-manager-client-for-msk
mvn clean install -f pom.xml
git clone https://github.com/aws-samples/clickstream-producer-for-apache-kafka.git 
cd clickstream-producer-for-apache-kafka
mvn clean install -f pom.xml
cp target/KafkaClickstreamClient-1.0-SNAPSHOT.jar  $KAFKA_HOME_DIR/utilities/ClickstreamClient-1.0-SNAPSHOT.jar

cd $DEVELOPER_HOME_DIR/devuser01
git clone https://github.com/build-on-aws/real-time-streaming-analytics-application-using-apache-kafka.git && cd real-time-streaming-analytics-application-using-apache-kafka
cd flink-clickstream-consumer
mvn clean package
aws s3 cp target/ClickstreamProcessor-1.0.jar s3://${streaming_artifacts_bucket}/msk-lab-resources/Flink/

sudo chown -R devuser01:devuser01 $DEVELOPER_HOME_DIR/devuser01/*

# Download and install PIP
sudo echo "export SOFTWARE_DOWNLOAD_DIR=$SOFTWARE_DOWNLOAD_DIR" | tee -a $EC2_USER_HOME_DIR/.bash_profile
sudo echo "export EC2_USER_HOME_DIR=$EC2_USER_HOME_DIR" | tee -a $EC2_USER_HOME_DIR/.bash_profile
sudo echo "export SCRIPT_DIR=$SCRIPT_DIR" | tee -a $EC2_USER_HOME_DIR/.bash_profile


cd $SOFTWARE_DOWNLOAD_DIR

wget https://bootstrap.pypa.io/get-pip.py

sudo su -c "python3.9 get-pip.py --user" -s /usr/bin/sh ec2-user
sudo su -c "/home/ec2-user/.local/bin/pip3 install boto3 --user" -s /usr/bin/sh ec2-user
sudo su -c "/home/ec2-user/.local/bin/pip3 install kafka-python --user" -s /usr/bin/sh ec2-user

# Setup OSS index and dashboard
curl -u '${ossuser}:${osspass}' -X PATCH https://${oss_domain_endpoint}/_plugins/_security/api/rolesmapping/all_access -H "Content-Type: application/json" -d '[{"op": "add", "path": "/backend_roles", "value": ["${kda_role_arn}"]}]' 
curl -u '${ossuser}:${osspass}' -s -w "\n" -XPUT https://${oss_domain_endpoint}/departments_count  -d @"$OPENSEARCH_HOME_DIR/scripts/departments_count.json" -H "Content-Type: application/json" 
curl -u '${ossuser}:${osspass}' -s -w "\n" -XPUT https://${oss_domain_endpoint}/user_session_counts  -d @"$OPENSEARCH_HOME_DIR/scripts/user_session_counts.json" -H "Content-Type: application/json"
curl -u '${ossuser}:${osspass}' -s -w "\n" -XPUT https://${oss_domain_endpoint}/user_session_details -d @"$OPENSEARCH_HOME_DIR/scripts/user_session_details.json" -H "Content-Type: application/json"
curl -XPOST https://${oss_domain_endpoint}/_dashboards/auth/login -H "osd-xsrf: true" -H "content-type:application/json" -d '{"username": "${ossuser}", "password" : "${osspass}"}' -c auth.txt
curl -XPOST https://${oss_domain_endpoint}/_dashboards/api/saved_objects/_import -H "osd-xsrf:true" -b auth.txt --form file=@"$OPENSEARCH_HOME_DIR/scripts/clickstream_dashboard.ndjson"

--==MYBOUNDARY==--\

