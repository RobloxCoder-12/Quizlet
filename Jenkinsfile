pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/RobloxCoder-12/Quizlet.git'
            }
        }

        stage('Build App') {
            steps {
                echo 'Building Quizlet App...'
                // For Node.js app:
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // Add your test commands here
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying to K8s cluster...'
                sh 'kubectl apply -f k8s/deployment.yaml'
                sh 'kubectl apply -f k8s/service.yaml'
            }
        }
    }
}
