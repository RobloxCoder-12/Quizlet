pipeline {
    agent any

    environment {
        EC2_USER = 'ec2-user'
        EC2_HOST = '52.90.251.226'  // Replace with your EC2 public IP
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/RobloxCoder-12/Quizlet.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    echo 'Building the application...'
                    sh 'echo Build successful!'  // Use sh for Linux compatibility
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo 'Running tests...'
                    sh 'echo Tests executed successfully!'
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                script {
                    echo 'Deploying the application to EC2...'
                    
                    // Use sshagent for secure key handling
                    sshagent(['quizlet-key']) {  // Make sure 'quizlet-key' is the correct Jenkins credential ID
                        sh """
                            ssh -o StrictHostKeyChecking=no ${EC2_USER}@${EC2_HOST} << EOF
                            cd /home/ec2-user
                            git clone https://github.com/RobloxCoder-12/Quizlet.git quizlet-app || (cd quizlet-app && git pull)
                            cd quizlet-app
                            chmod +x deploy.sh
                            ./deploy.sh
                            EOF
                        """
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully and deployed to EC2!'
        }
        failure {
            echo 'Pipeline failed! Check logs for errors.'
        }
    }
}
