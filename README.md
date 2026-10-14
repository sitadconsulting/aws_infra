# **Acknowledgement**

We at SitadConsulting, are delighted and grateful to God Almighty for enabling us make this piece of work available today for public use. 

# **Introduction**
In this repository, you will find a series of Terraform modules particularly for AWS and Kubernetes Providers.
These modules are based around a concept we coined as Terraform "micro-module". With this approach we set the basic unit of a Terraform module to a resource object.

Thanks to the innovative work by the folks at Hashi, we have leveraged both locals and the for_each constructs as core part of this Terraform micro-module idea. This we believe
allows for a more expressive way in defining highly complex cloud infrastructure solutions from composable micro-modules. furthermore, it allowed us to decouple the code base from the configuration required to build out infrastructure, adhering to the WORM principle of software development.

# **Usage Examples**

We have provided usage examples of this idea with companion implementation guide in the docs directory of each project. Follow the link below to access each project directory, you will find corresponding implementation guide in the docs folder. 
 + [Building a Glue streaming and Transactional data lake solution](projects/proj1/)
 + [Building A Secure Containerized Nginx Web Server With EKS Container Orchestration Platform](projects/proj12)
 + [Stream_Event_Processing_and_Data_Analytics_with_AWS MSK-KDA Flink-GLUE-OSS](projects/proj2)
 + [Building_A_Real-Time_Database_Replication_And_Change_Data_Capture_Solution_With_MSKConnect-MSK-Cluster_and_Debezium-MySQL-Connector](projects/proj3)

Instead of having all your configuration in one single data.tf file, you could split out the configuration as you see fit, you could name files based on project and/or AWS service name for instance.

# **Help us improve, your feedback will be invaluable**
We'd love for you to engage and explore the set of currently available modules and provided examples. We'd also love to hear from you, if you would like to raise an issue, please send an email at hello@sitadconsulting.com, so we can add you as a collaborator.

# **Our Goal**
Our goal for making this available to the public is to help businesses seeking to mordernize in the cloud or adopt cloud services for the first time, leverage the resouces we have provided in other to accelerate thier journey. As a company, we are committed to seeing enterprises thrive and succeed in the shift to adopting or modernizing in the cloud.
We are here to help. Please feel free to reach out to us at hello@sitadconsulting.com if you like to engage our service.

# **Love what you see and want to contribute, then consider joining us or become a Partner**
We would love to continue to make more of this work available for public use, if you share our ideals and would love to help, we would like to hear from you. We are seeking to build a community, a confluence of value creating ecosystems. Please reach out to us at hello@sitadconsulting.com

Thank you and fare well.

# **License Summary**

The documentation is made available under the Creative Commons Attribution-ShareAlike 4.0 International License. See the LICENSE file.

The sample code within this documentation is made available under a modified MIT license. See the LICENSE-SAMPLECODE file.


