### TASK
Develop and deploy via AWS CLI CloudFormation script which will create next infrastructure 
* Auto-scaling group (ASG) with two EC2 instances within it (we need to ensure that min amount of instances in the ASG is 2)
* Allow SSH and HTTP access to EC2 instances
* Add the ability for EC2 instances to install Java 8 during startup


##### Nonfunctional requirements:
* Use Parameters section in CloudFormation script for customization of input values for your script (such as EC2 instance type, AMI ID, KeyName file, etc). Also ensure that you provided default values for them.



### Deploying command:
```bash
aws cloudformation deploy --template-file CloudFormation.yml --stack-name My-WebServer
aws cloudformation delete-stack --stack-name My-WebServer
```