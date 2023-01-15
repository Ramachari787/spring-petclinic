pipeline {
   agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
        }
    }

    stages {
        stage('Checkout') {

            steps {
               // git branch: "master", url: "repo url", credentialsId: 'id'
            }
         }

          stage ("build") {
              steps {
                sh 'mvn clean package '
              }
        }
    }
}
