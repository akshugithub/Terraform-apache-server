pipeline {
    agent any
    tools { 
        maven 'maven_home' 
           }
    
           stages {
      stage('GIT checkout') {
           steps {
             git branch: 'main', url: 'https://github.com/akshugithub/Terraform-apache-server.git'
          }
        }
               
      stage('Deploy'){
             steps{
                 
		   sh 'ansible aws_ec2 -i aws_ec2.yaml -m ping --ssh-common-args="-o StrictHostKeyChecking=no" -u ubuntu --private-key=/var/lib/jenkins/keypair.pem'
		   sh 'ansible-playbook Deploy.yml -i aws_ec2.yaml --ssh-common-args="-o StrictHostKeyChecking=no" -u ubuntu --private-key=/home/ubuntu/keypair.pem'
		  
          }
       }            
