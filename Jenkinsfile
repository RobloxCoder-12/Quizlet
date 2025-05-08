pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'quizlet-app:latest'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Build the Docker image using bat for Windows
                    bat 'docker build -t %DOCKER_IMAGE% .'
                }
            }
        }

        stage('Push') {
            steps {
                script {
                    // Push the Docker image to the registry using bat for Windows
                    bat 'docker push %DOCKER_IMAGE%'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deploy the image (this could vary based on your deployment method)
                    // Example for Kubernetes or other environments:
                    bat 'kubectl set image deployment/quizlet-app quizlet-app=%DOCKER_IMAGE%'
                }
            }
        }
    }
}





