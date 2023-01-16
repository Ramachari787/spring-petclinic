pipeline {
  environment {
    registry = "ramjfrogdev.jfrog.io"
    registryCredential = 'jforg-reg'
    dockerImage = ''
  }
  agent any
  tools {
    maven 'Maven 3.8.5'
    jdk 'jdk11'
  } 
  stages {
    stage('SCM Checkout') {
      steps {
        git 'https://github.com/Ramachari787/spring-petclinic.git'
      }
    }
    stage('pckage') {
       steps {
         sh 'mvn package'
       }
    }
    stage('To run Test cases') {
      steps {
        sh '''
        mvn clean install

        '''
      }
    }
    stage('Building Image') {
      steps{
        script {
          dockerImage = docker.build registry + ":1.0.0"
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }

  }
}
