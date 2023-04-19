pipeline {
    agent any
    tools { 
        maven 'maven_home' 
           }
    
           stages {
		   
      stage('terraform build') {
            steps{
                   sh "mvn clean package"
		   sh "terraform --version"
		   sh "terraform init"
		   sh "terraform fmt" 
		   sh "terraform plan"
		   sh "terraform apply --auto-approve"
	          }
		}		   
      stage('GIT checkout') {
           steps {
             git branch: 'main', url: 'https://github.com/akshugithub/Terraform-apache-server.git'
          }
        }
               
      stage('Deploy'){
             steps{
                 
		   sh 'ansible aws_ec2 -i dynamicinventory.yaml -m ping --ssh-common-args="-o StrictHostKeyChecking=no" -u ubuntu --private-key=/var/lib/jenkins/mykeypair.pem'
		   sh 'ansible-playbook deployment.yaml -i dynamicinventory.yaml --ssh-common-args="-o StrictHostKeyChecking=no" -u ubuntu --private-key=/home/ubuntu/mykeypair.pem'
		  
          }
       }            
	   }
}
