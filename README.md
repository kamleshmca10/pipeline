# pipeline
A CI/CD pipeline using git, jenkins, artifactory, docker and plays written in ansible

## to provision with ec2 
requirements are:
- python 2.6 =>
- boto module
- aws account with aws_access_key + aws_secret_key
- aws ec2.py file under /etc/ansible/hosts and a configured ansible.cfg file 
- aws keypair to connect to aws.
