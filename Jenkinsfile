pipeline {
    agent any

    options {
        buildDiscarder(logRotator(numToKeepStr: '1'))
    }
    environment {
		DOCKERHUB_CREDENTIALS=credentials('aman-aws-cred')
	}
    stages {
        stage('Build Image') {
            steps {
                sh 'docker build -t kiplphp38/nginx-vite-project:1.1 .'
            }
        }

        stage('Login') {
            steps {
                sh 'docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'
            }
        }

        stage('Push') {

			steps {
				sh 'docker push kiplphp38/nginx-vite-project:1.1'
			}
		}
    }

    post {
		always {
			sh 'docker logout'
		}
	}
}