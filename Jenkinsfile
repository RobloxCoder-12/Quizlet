pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'quizlet-app'
        DOCKER_HUB_REPO = 'yourdockerhubusername/quizlet'
        KUBERNETES_DEPLOYMENT_NAME = 'quizlet-deployment'
    }

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build App') {
            steps {
                script {
                    bat 'echo Building the application...'
                    bat 'npm install'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t %DOCKER_HUB_REPO%:latest ."
            }
        }

        stage('Push Image to Docker Hub') {
            environment {
                DOCKER_USER = credentials('docker-username') // use your Jenkins credentials ID
                DOCKER_PASSWORD = credentials('docker-password')
            }
            steps {
                bat 'echo Logging in to Docker Hub...'
                bat 'docker login -u %DOCKER_USER% -p %DOCKER_PASSWORD%'
                bat "docker push %DOCKER_HUB_REPO%:latest"
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                bat "kubectl set image deployment/%KUBERNETES_DEPLOYMENT_NAME% %DOCKER_IMAGE_NAME%=%DOCKER_HUB_REPO%:latest"
                bat "kubectl rollout status deployment/%KUBERNETES_DEPLOYMENT_NAME%"
            }
        }

        stage('Test App') {
            steps {
                bat 'echo Testing the application...'
                // Add test steps here
            }
        }

        stage('Cleanup') {
            steps {
                bat 'echo Cleanup step completed.'
                // Add any needed cleanup commands
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
        failure {
            echo '❌ Deployment failed.'
        }
    }
}

