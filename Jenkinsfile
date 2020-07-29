#!/usr/bin/env groovy

properties([[$class: 'ParametersDefinitionProperty', parameterDefinitions: [
[$class: 'hudson.model.StringParameterDefinition', name: 'NODE_PORT',defaultValue: "9010"] 
 ]]])

pipeline {
  agent { docker { image 'python:3.8.5-alpine3.12' } }
  
  stages {
    
	//=========================================Start=============================================================
	// Check out the source code with jenkins spl variable scm
    stage 'Checkout'
    checkout scm
	
	//=========================================INIT==============================================================
	stage("Init"){
       echo " WorkSpace : ${WORKSPACE}"
       env.MS_NAME="pythontest"
       env.IMAGE_NAME="localhost:5000/${MS_NAME}:latest"
    }
    //=========================================Build/Install==============================================================
    stage('build') {
      steps {
        sh 'pip install -r requirements.txt'
      }
    }
	//=========================================Test==============================================================
    stage('test') {
      steps {
        sh 'python test.py'
      }   
    }
	//=========================================Build Artifact==============================================================
	stage ("Build Artifact"){
      sh '''
          docker build -t ${IMAGE_NAME} -f ${WORKSPACE}/Dockerfile .

          if [ "$(docker ${DOCKER_OPTS} ps -qa -f name=${MS_NAME})" ]; then
              echo " Found docker container "
               if [ "$(docker ${DOCKER_OPTS} ps -q -f name=${MS_NAME})" ]; then
                          echo " Stop the container "
                         docker ${DOCKER_OPTS} stop ${MS_NAME}
               fi
            docker ${DOCKER_OPTS} rm ${MS_NAME}
          fi
           echo " Starting the container "
           docker ${DOCKER_OPTS} container run -d --name=${MS_NAME} -p ${NODE_PORT}:5001 ${IMAGE_NAME}
         '''
    }
  
	//=========================================Deploy==============================================================
	//stage('deploy'){
	  // steps {
	    // sh 'python app.py'  
	   //} 
	//}
	//=========================================End==============================================================
	
  }
}