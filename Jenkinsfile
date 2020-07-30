#!/usr/bin/env groovy

node{
  // Check out the source code with jenkins spl variable scm
  stage 'Checkout'
  checkout scm
  
    
	stage('Initialize'){
		def dockerHome = tool 'myDocker'
		env.PATH = "${dockerHome}/bin:${env.PATH}"
		env.PATH="${PATH}:/usr/local/bin"
	   }

    //agent { docker { image 'python:3.8.5-alpine3.12' } }
  
	 //  stages {
		
	//=========================================Start=============================================================
	
	/* cloning the repository to our workspace */
	//stage ('Clone Repository'){
	//	steps{
	//	 checkout scm
	//	}
	//}
	stage('Docker Image') {
			sh 'docker build -t personal-python-test .'
		}
    
	//=========================================Run Image / Create Container ==============================================================
		stage('Run Image / Container Creation') {
			sh 'docker run -d --name myfirstcontainer personal-python-test'
		}
		
	//=========================================Initialize=============================================================
	   	
	stage('build ') {
			sh 'pip install -r requirements.txt'
		}	
    
	
		
	//=========================================Build Images ==============================================================
		
		
		//=========================================Test==============================================================
		stage('test') {
			sh 'python ./test.py'
		}
		
		
		//=========================================Run Image / Create Container ==============================================================
		stage('Run Image / Container Creation') {
			sh 'docker run -d --name myfirstcontainer personal-python-test'
		}
		
		
			
		//=========================================End==============================================================
		
	//  }
}
