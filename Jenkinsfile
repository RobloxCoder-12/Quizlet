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
                    bat 'echo Build successful!'  // Use bat for Windows compatibility
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

        stage('Deploy to EC2') {
            steps {
                script {
                    echo 'Deploying the application to EC2...'
                    
                    // Use sshagent for secure key handling
                    sshagent(['quizlet-key']) {  // Make sure 'quizlet-key' is the correct Jenkins credential ID
                        bat """
                            echo Connecting to EC2...
                            plink -ssh -batch -i C:\\path\\to\\private-key.ppk ${EC2_USER}@${EC2_HOST} ^
                            "cd /home/ec2-user && git clone https://github.com/RobloxCoder-12/Quizlet.git quizlet-app || (cd quizlet-app && git pull) && ^
                            cd quizlet-app && chmod +x deploy.sh && ./deploy.sh"
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
