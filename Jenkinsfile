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
                sh 'docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}'
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
		}
	}
}