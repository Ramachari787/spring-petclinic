pipeline {
  environment {
    registry = "ram/spring-petclinic"
    registryCredential = 'jforg-reg'
    dockerImage = ''
  }
  agent any
  tools {
    maven 'Maven 3.3.9'
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
          dockerImage = docker.build registry + ":latest"
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
