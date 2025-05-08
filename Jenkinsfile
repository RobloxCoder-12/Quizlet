pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'quizlet-app'  // Docker image name
        DOCKER_TAG = 'latest'  // Docker tag name
        DOCKER_CREDENTIALS = 'docker-hub-creds'  // Jenkins credentials for Docker Hub login
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
                    echo 'Building Docker image...'
                    bat 'docker build -t %DOCKER_IMAGE%:%DOCKER_TAG% .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    echo 'Logging into Docker Hub...'
                    // Login to Docker Hub using Jenkins credentials
                    withCredentials([usernamePassword(credentialsId: 928122f6-ce90-49ac-a982-1ee44c55c50b, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        bat 'echo %DOCKER_PASSWORD% | docker login --username %DOCKER_USERNAME% --password-stdin'
                    }
                    
                    echo 'Pushing Docker image to Docker Hub...'
                    // Push the built image to Docker Hub
                    bat 'docker push %DOCKER_IMAGE%:%DOCKER_TAG%'
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application...'
                // Add deployment steps if required here
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            // Clean up Docker images after the pipeline is complete to save space
            bat 'docker system prune -f'
        }
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}





