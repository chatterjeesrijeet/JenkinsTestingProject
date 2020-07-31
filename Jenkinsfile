#!/usr/bin/env groovy
pipeline {
 
  stages {
    
	agent { docker { image 'python:3.7.2' } }
	
    stage('build') {
      steps {
        sh 'pip install -r requirements.txt'
      }
    }
	
	
	
    stage('test') {
      steps {
        sh 'python test.py'
      }   
    }
	
  }
  
  stage('Initialize'){
		def dockerHome = tool 'myDocker'
		env.PATH = "${dockerHome}/bin:${env.PATH}"
	   }
	   
  stage('Docker Image') {
			sh 'docker build -t personal-python-test .'
		}
   
		
  stage('Run Image / Container Creation') {
			sh 'docker run -d --name myfirstcontainer personal-python-test'
	}
		
	
  
}
