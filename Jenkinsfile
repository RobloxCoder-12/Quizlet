pipeline {
    agent any

    environment {
        IMAGE_NAME = 'ks2363/quizlet-app'
        IMAGE_TAG = 'latest'
        DOCKERHUB_CREDENTIALS = '928122f6-ce90-49ac-a982-1ee44c55c50b' // DO NOT CHANGE
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDENTIALS}", usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    }
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    dockerImage.push()
                }
            }
        }

        stage('Cleanup') {
            steps {
                sh 'docker rmi ${IMAGE_NAME}:${IMAGE_TAG} || true'
            }
        }
    }
}








