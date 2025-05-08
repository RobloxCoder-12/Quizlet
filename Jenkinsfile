pipeline {
    agent any
    environment {
        DOCKER_IMAGE_NAME = 'quizlet-app'
        DOCKER_HUB_REPO = 'yourdockerhubuser/quizlet'
        KUBERNETES_DEPLOYMENT_NAME = 'quizlet-deployment'
    }
    stages {
        stage('Checkout SCM') {
            steps {
                script {
                    checkout scm
                }
            }
        }

        stage('Build App') {
            steps {
                script {
                    // Build commands for Windows (use `bat` for Windows)
                    bat 'echo Building the application...'
                    bat 'npm install'
                    bat 'npm run build'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    bat 'docker build -t ${DOCKER_IMAGE_NAME} .'
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub and push the image
                    bat 'docker login -u $DOCKER_USER -p $DOCKER_PASSWORD'
                    bat 'docker push ${DOCKER_HUB_REPO}:${DOCKER_IMAGE_NAME}'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Deploy the Docker image to Kubernetes
                    bat 'kubectl set image deployment/${KUBERNETES_DEPLOYMENT_NAME} ${DOCKER_IMAGE_NAME}=${DOCKER_HUB_REPO}:${DOCKER_IMAGE_NAME}'
                    bat 'kubectl rollout status deployment/${KUBERNETES_DEPLOYMENT_NAME}'
                }
            }
        }

        stage('Test App') {
            steps {
                script {
                    // Test application
                    bat 'echo Testing the application...'
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    // Cleanup operations, if any
                    bat 'echo Cleaning up...'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }

        failure {
            echo 'Deployment Failed.'
        }
    }
}

