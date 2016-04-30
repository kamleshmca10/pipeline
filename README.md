# pipeline
A CI/CD pipeline using ec2, jenkins together with plays using ansible

Will add automated build tests, bring up and down hosts do some tests like api against some service and then tear down the machine and pass the artifact to the next stage.
I will also add automatic builds for different artifacts, java, go, rpm etc... and all of them will bring up and down different services and test them etc...

This is a work in progress so check back regularly.

## Provision with ec2 
requirements are:
- python 2.6 =>
- boto module
- aws account with aws_access_key + aws_secret_key
- aws ec2.py file under /etc/ansible/hosts and a configured ansible.cfg file 
- aws keypair to connect to aws (uploaded to aws as well as located somewhere where your ssh config can find it and use it).

### Ansible Roles being used:

# Jenkins

Installs Jenkins CI 2.0 on RHEL/CentOS server.

## Requirements

Requires `curl` to be installed on the server.

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

    jenkins_hostname: '{{ ec2_private_dns_name }}'

The system hostname; If using ec2 then the dns name works fine. This will be used during setup to communicate with the running Jenkins instance via HTTP requests.

    jenkins_http_port: 8080

The HTTP port for Jenkins' web interface.

    jenkins_jar_location: /opt/jenkins-cli.jar

The location at which the `jenkins-cli.jar` jarfile will be kept. This is used for communicating with Jenkins via the CLI.

    jenkins_connection_delay: 5
    jenkins_connection_retries: 60

Amount of time and number of times to wait when connecting to Jenkins after initial startup, to verify that Jenkins is running. Total time to wait = `delay` * `retries`, so by default this role will wait up to 300 seconds before timing out.

    jenkins_admin_user: admin

The user you want to use for login to the Jenkins UI (will defaul to password admin)
Please change this after initial login.

    jenkins_admin_email: admin@email.com

The email address used for the admin user.

    jenkins_do_initial: true

This boolean value will dictate whether or not you want jenkins 2.0 to run it's
initial setup-wizard - configuring plugins, users etc... on the first run.


 ## Dependencies

    - java

### Ansible Roles being used:

# Java

Installs Java on RHEL/CentOS server.


## Role Variables

    java_packages: java-1.8.0-openjdk

This variable will decide what version of java to install to your host


## Example Playbook

    - hosts: tag_jenkins_master
      remote_user: ec2-user
      vars:
        java_packages: java-1.8.0-openjdk
        jenkins_hostname: '{{ ec2_private_dns_name }}'
        jenkins_admin_user: admin
        jenkins_admin_email: admin@email.com
        jenkins_do_initial: false
        ansible_python_interpreter: "/usr/bin/env python"
      gather_facts: True
      roles:
        - { role: java , become: yes, become_method: sudo }
        - { role: jenkins, become: yes, become_method: sudo }
