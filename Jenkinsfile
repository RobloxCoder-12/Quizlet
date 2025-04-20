pipeline {
    agent any

    environment {
        TF_VAR_region = "us-east-1"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git url: 'https://github.com/RobloxCoder-12/Quizlet.git', branch: 'main'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') { // change this if your .tf files are elsewhere
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir('terraform') {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Apply Terraform changes?', ok: 'Apply'
                dir('terraform') {
                    sh 'terraform apply tfplan'
                }
            }
        }
    }

    post {
        always {
            echo 'Terraform Pipeline Finished.'
        }
    }
}
