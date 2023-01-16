pipeline {
    agent any

    options {
        buildDiscarder(logRotator(numToKeepStr: '1'))
    }
    environment {
		DOCKERHUB_CREDENTIALS=credentials('aman-dockerhub-creds')
        BUILD_IMAGE='kiplphp38/nginx-vite-project:1.1'
	}
    stages {
        stage('Build Image') {
            steps {
                sh 'docker build -t $BUILD_IMAGE .'
            }
        }

        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push') {
			steps {
				sh 'docker push $BUILD_IMAGE'
			}
		}
    }

    post {
		always {
			sh '''
            docker rmi $BUILD_IMAGE
            docker logout
            '''
            cleanWs(patterns: [[pattern: '.git/**', type: 'INCLUDE']])
		}
	}
}