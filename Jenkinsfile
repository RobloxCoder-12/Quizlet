pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'quizlet-app'
        DOCKER_TAG = 'latest'
        DOCKER_HUB_REPO = 'ks2363/quizlet-app' // replace with your DockerHub username/repo
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
                    bat "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                }
            }
        }

        stage('Tag Docker Image') {
            steps {
                script {
                    echo 'Tagging Docker image with remote repository name...'
                    bat "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_HUB_REPO}:${DOCKER_TAG}"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: '928122f6-ce90-49ac-a982-1ee44c55c50b', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    script {
                        echo 'Logging into Docker Hub...'
                        bat """
                            echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin
                            docker push ${DOCKER_HUB_REPO}:${DOCKER_TAG}
                        """
                    }
                }
            }
        }
    }
}







