pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "ks2363/quizlet"
        GIT_BRANCH = "main"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: "${GIT_BRANCH}", url: 'https://github.com/RobloxCoder-12/Quizlet.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image: ${DOCKER_IMAGE}:${env.BUILD_NUMBER}"
                    docker.build("${DOCKER_IMAGE}:${env.BUILD_NUMBER}")
                    bat 'docker tag ks2363/quizlet:14 ks2363/quizlet:latest'

                }
            }
        }
        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: '928122f6-ce90-49ac-a982-1ee44c55c50b', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.push("${DOCKER_IMAGE}:${env.BUILD_NUMBER}")
                    docker.push("${DOCKER_IMAGE}:latest")
                }
            }
        }
    }
    post {
        always {
            echo 'Cleaning up workspace...'
            cleanWs()
        }
    }
}



