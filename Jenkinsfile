#!/usr/bin/env groovy

pipeline {

   environment {
     dockerHome = tool 'myDocker'
   }
   agent { docker { image 'python:3.8.5-alpine3.12' } }
  
	   stages {
		
		//=========================================Start=============================================================
		
		/* cloning the repository to our workspace */
		stage ('Clone Repository'){
			steps{
			 checkout scm
			}
		}
        
		//=========================================Initialize=============================================================
	   	stage('Initialize'){
                env.PATH = "${dockerHome}/bin:${env.PATH}"
        }
		//=========================================Build Images ==============================================================
		
		stage('build Image') {
		  steps {
			sh 'pip install -r requirements.txt'
			sh 'docker build -t personal-python-test .'
		  }
		}
		
		//=========================================Run Image / Create Container ==============================================================
		stage('Run Image / Container Creation') {
		  steps {
			sh 'docker run -d --name myfirstcontainer personal-python-test'
		  }
		}
		
		//=========================================Test==============================================================
		stage('test') {
		  steps {
			sh 'python ./test.py'
		  }   
		}
			
		//=========================================End==============================================================
		
	  }
}