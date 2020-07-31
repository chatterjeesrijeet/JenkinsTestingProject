#!/usr/bin/env groovy
pipeline {
 
 agent{
  node {
      label 'master'
    }
 }
	
 stages {
 
  stage('Initialize'){
    steps{
        script{
		def dockerHome = tool 'myDocker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
		}
       }
  }
	  
    stage('build') {
	  agent { docker { image 'python:3.7.2' } }
      steps {
        sh 'pip install -r requirements.txt'
      }
    }
    stage('test') {
	agent { docker { image 'python:3.7.2' } }
      steps {
        sh 'python ${WORKSPACE}/src/test.py'
      }
    }
  stage('Docker Image') {
      steps{
	      sh 'docker build -t personal-python-test .'
		  }
        }
  stage('Run Image / Container Creation') {
        steps{
		sh 'docker run -d --name myfirstcontainer personal-python-test'
		}
    }
    }
}
