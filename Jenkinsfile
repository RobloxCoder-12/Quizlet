pipeline {
    agent any
    
    environment {
        DOCKER_CREDENTIALS = credentials('928122f6-ce90-49ac-a982-1ee44c55c50b') // Your provided Docker Hub credentials ID
        DOCKER_IMAGE = 'quizlet-app:latest'
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
                    echo 'Building Docker image...'
                    bat 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    echo 'Logging into Docker Hub...'
                    withCredentials([usernamePassword(credentialsId: '928122f6-ce90-49ac-a982-1ee44c55c50b', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        bat """
                            docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}
                            docker push ${DOCKER_IMAGE}
                        """
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application...'
                // Add deployment steps if any
            }
        }

        stage('Cleanup') {
            steps {
                echo 'Cleaning up...'
                bat 'docker system prune -f'
            }
        }
    }
}





