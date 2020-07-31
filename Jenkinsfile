#!/usr/bin/env groovy

	//agent { docker { image 'python:3.8.5-alpine3.12' } }

	
node{
  // Check out the source code with jenkins spl variable scm
    stage 'Checkout'
    checkout scm
    
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
	
	stage('build ') {
			sh 'pip install -r requirements.txt'
		}	
		
	stage('test') {
	        sh 'pwd'
			sh 'python ./test.py'
		}
}
