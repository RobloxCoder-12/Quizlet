    pipeline {
    agent any

    environment {
        TF_DIR = 'infra' // Folder where Terraform files are located (adjust as needed)
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
                echo 'Planning infrastructure changes...'
                def planOutput = bat(script: 'terraform plan -out=tfplan > plan_output.txt 2>&1', returnStatus: true)
                bat 'type plan_output.txt' // show output in Jenkins log

                if (planOutput != 0) {
                    error 'Terraform Plan failed. See plan_output.txt for details.'
                }
            }
        }
    }
}


        stage('Terraform Apply') {
            steps {
                dir("${TF_DIR}") {
                    script {
                        echo 'Applying infrastructure changes...'
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
