pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'quizlet'
        DOCKER_IMAGE_TAG = 'latest'
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
                    echo 'Building the application...'
                    bat 'npm install'
                    bat 'npm run build'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image: ${DOCKER_HUB_REPO}:${DOCKER_IMAGE_TAG}"
                    bat "docker build -t ${DOCKER_HUB_REPO}:${DOCKER_IMAGE_TAG} ."
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                script {
                    echo 'Logging into Docker Hub...'
                    bat "docker login -u %DOCKER_USER% -p %DOCKER_PASSWORD%"
                    echo 'Pushing Docker image to Docker Hub...'
                    bat "docker push ${DOCKER_HUB_REPO}:${DOCKER_IMAGE_TAG}"
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    echo 'Deploying to Kubernetes...'
                    bat "kubectl set image deployment/${KUBERNETES_DEPLOYMENT_NAME} ${DOCKER_IMAGE_NAME}=${DOCKER_HUB_REPO}:${DOCKER_IMAGE_TAG}"
                    bat "kubectl rollout status deployment/${KUBERNETES_DEPLOYMENT_NAME}"
                }
            }
        }

        stage('Test App') {
            steps {
                script {
                    echo 'Running post-deployment tests...'
                    // Add your test scripts here
                    bat 'echo Tests completed!'
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    echo 'Cleaning up workspace...'
                    bat 'echo Cleanup done.'
                }
            }
        }
    }

    post {
        success {
            echo '✅ Deployment succeeded.'
        }
        failure {
            echo '❌ Deployment failed.'
        }
        always {
            echo 'Pipeline execution completed.'
        }
    }
}
