### TASK
Develop and deploy via AWS CLI CloudFormation script which will create next infrastructure:
* Single EC2 instance

##### Nonfunctional requirements:
* Use Parameters section in CloudFormation script for customization of input values for your script (such as EC2 instance type, AMI ID, etc). Also ensure that you provided default values for them.
* Use Outputs section in CloudFormation script for declaring output values. IP address of the created EC2 instance should be available as output parameter after stack creation


### Deploying command:
```bash
aws cloudformation deploy --template-file CloudFormation.yml --stack-name My-WebServer
aws cloudformation delete-stack --stack-name My-WebServer
```