pipeline {
    agent {
        docker {
            image 'node:6-alpine'
            args '-p 3000:3000'
        }
    }

    options {
        buildDiscarder(logRotator(numToKeepStr: '1'))
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building'
            }
        }
    }
}