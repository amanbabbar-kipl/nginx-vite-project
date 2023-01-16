pipeline {
    agent any

    options {
        buildDiscarder(logRotator(numToKeepStr: '1'))
    }
    
    stages {
        stage('Build Image') {
            steps {
                echo 'Building'
            }
        }

        stage('Test') {
            steps {
                sh '''
                docker -v
                sleep 1
                echo $! > .pidfile
                '''
            }
        }
    }
}