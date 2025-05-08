pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "ks2363/quizlet:latest"  // Your Docker Hub username and image name
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/RobloxCoder-12/Quizlet.git'  // Checkout from your Git repository
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }
        stage('Login to Docker Hub') {
            steps {
                // Authenticate to Docker Hub using your credentials stored in Jenkins
                withCredentials([usernamePassword(credentialsId: '928122f6-ce90-49ac-a982-1ee44c55c50b', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Push the built image to Docker Hub
                    docker.push("${DOCKER_IMAGE}")
                }
            }
        }
    }
    post {
        always {
            echo 'Cleaning up...'
            cleanWs()  // Clean up the workspace after the pipeline
        }
    }
}


