#!/usr/bin/env groovy
pipeline {
  agent { docker { image 'python:3.8.5-alpine3.12' } }
  stages {
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
	stage('deploy'){
	   steps {
	     sh 'python app.py'  
	   } 
	}
  }
}