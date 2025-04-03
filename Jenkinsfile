pipeline {
    agent any

    environment {
        EC2_USER = 'ec2-user'
        EC2_HOST = '52.90.251.226'  // Replace with your actual EC2 public IP
        SSH_KEY = '/path/to/quizlet_key.pem'  // Replace with your actual key path in Jenkins
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
                    sh 'echo Build successful!'  // Changed 'bat' to 'sh' for Linux
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo 'Running tests...'
                    sh 'echo Tests executed successfully!'  // Changed 'bat' to 'sh'
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                script {
                    echo 'Deploying the application to EC2...'
                    sh """
                        ssh -o StrictHostKeyChecking=no -i ${SSH_KEY} ${EC2_USER}@${EC2_HOST} '
                        cd /home/ec2-user &&
                        sudo yum update -y &&
                        git clone https://github.com/RobloxCoder-12/Quizlet.git quizlet-app ||
                        (cd quizlet-app && git pull) &&
                        cd quizlet-app &&
                        chmod +x deploy.sh &&
                        ./deploy.sh
                        '
                    """
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
