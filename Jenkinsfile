pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS_ID = '928122f6-ce90-49ac-a982-1ee44c55c50b'  // Reference to the credentials ID you added
    }

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image: ks2363/quizlet:17"
                    bat 'docker build -t ks2363/quizlet:17 .'
                }
            }
        }

        stage('Tag Docker Image') {
            steps {
                script {
                    echo "Tagging Docker image as latest"
                    bat 'docker tag ks2363/quizlet:17 ks2363/quizlet:latest'
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CREDENTIALS_ID, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    script {
                        echo "Logging into Docker Hub"
                        bat "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    echo "Pushing Docker image to Docker Hub"
                    bat 'docker push ks2363/quizlet:latest'
                }
            }
        }

        stage('Post Actions') {
            steps {
                cleanWs()
            }
        }
    }
}





