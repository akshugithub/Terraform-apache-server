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
