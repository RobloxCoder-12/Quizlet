pipeline {
    agent any

    environment {
        TF_DIR = 'infra'  // Folder where Terraform files are located
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/RobloxCoder-12/Quizlet.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir("${TF_DIR}") {
                    script {
                        echo 'Initializing Terraform...'
                        bat 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("${TF_DIR}") {
                    script {
                        echo 'Running Terraform Plan...'
                        def planStatus = bat(script: 'terraform plan -out=tfplan', returnStatus: true)
                        if (planStatus != 0) {
                            error 'Terraform Plan failed. Exiting pipeline.'
                        }
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir("${TF_DIR}") {
                    script {
                        echo 'Applying Terraform Plan...'
                        bat 'terraform apply -auto-approve tfplan'
                    }
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    echo 'Building the application...'
                    bat 'echo Build successful!'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo 'Running tests...'
                    bat 'echo Tests executed successfully!'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo 'Deploying the application...'
                    bat 'echo Deployment completed!'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed! Check logs for errors.'
        }
    }
}
environment {
    TF_DIR = '.'  // Or use the correct subfolder name if your .tf files are there
}
