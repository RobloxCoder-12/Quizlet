pipeline {
    agent any

    environment {
        TF_IN_AUTOMATION = "true"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/RobloxCoder-12/Quizlet'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                input "Apply the changes?"
                dir('terraform') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
