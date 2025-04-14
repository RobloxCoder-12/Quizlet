pipeline {
    agent any
    
    environment {
        GIT_REPO = 'https://github.com/RobloxCoder-12/Quizlet'
        BRANCH_NAME = 'main'
    }
    
    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }
        
        stage('Clone Repo') {
            steps {
                script {
                    echo "Cloning repository from ${GIT_REPO}..."
                    bat "git clone ${GIT_REPO}"
                }
            }
        }
        
        stage('Terraform Init') {
            steps {
                script {
                    echo "Running Terraform Init..."
                    bat 'terraform init'
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                script {
                    echo "Running Terraform Plan..."
                    bat 'terraform plan'
                }
            }
        }
        
        stage('Terraform Apply') {
            steps {
                script {
                    echo "Applying Terraform changes..."
                    bat 'terraform apply -auto-approve'
                }
            }
        }
    }
    
    post {
        success {
            echo "Pipeline successfully completed!"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}

