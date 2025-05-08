pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "ks2363/quizlet:17"
        DOCKER_REGISTRY = "docker.io"
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
                    echo "Building Docker image: ${DOCKER_IMAGE}"
                    bat "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Tag Docker Image') {
            steps {
                script {
                    echo "Tagging Docker image as latest"
                    bat "docker tag ${DOCKER_IMAGE} ks2363/quizlet:latest"
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub-password', variable: 'DOCKER_PASSWORD')]) {
                    script {
                        echo "Logging into Docker Hub"
                        bat "echo ${DOCKER_PASSWORD} | docker login -u ks2363 --password-stdin"
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    echo "Pushing Docker image to Docker Hub"
                    bat "docker push ${DOCKER_IMAGE}"
                    bat "docker push ks2363/quizlet:latest"
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}




