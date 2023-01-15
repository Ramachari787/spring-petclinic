pipeline {
    agent none

    options {
        buildDiscarder(logRotator(daysToKeepStr: '10'))
        timestamps()
    }

stages {
                        stage('Prepare Docker') {
                            steps {
                                sh '''
                                //docker buildx create --use
                                docker run maven
                                '''
                            }
                        }
}
