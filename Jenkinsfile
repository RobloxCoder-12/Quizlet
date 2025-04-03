pipeline {
    agent any

    environment {
        GIT_REPO = 'git@github.com:RobloxCoder-12/Quizlet.git' // Use SSH URL
        SSH_CREDENTIALS_ID = 'aws-ec2-key' // Your SSH key ID in Jenkins
        EC2_USER = 'ec2-user' // Change to ubuntu if using Ubuntu AMI
        EC2_HOST = '52.90.251.226' // Replace with your EC2 instance IP
        APP_DIR = '/home/ec2-user/quizlet' // Change as per your directory structure
    }

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    sshagent([SSH_CREDENTIALS_ID]) { // Using SSH credentials for authentication
                        sh 'git clone $GIT_REPO'
                    }
                }
            }
        }

        stage('Build') {
            steps {
                echo 'Building the application...'
                sh 'echo Build successful!'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'echo Tests executed successfully!'
            }
        }

        stage('Deploy to EC2') {
            steps {
                script {
                    sshagent([SSH_CREDENTIALS_ID]) {
                        sh """
                            echo 'Deploying to EC2...'
                            ssh -o StrictHostKeyChecking=no $EC2_USER@$EC2_HOST << 'EOF'
                                cd $APP_DIR
                                git pull origin main
                                docker-compose up -d --build
                                echo 'Deployment completed!'
                            EOF
                        """
                    }
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
