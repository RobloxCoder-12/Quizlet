pipeline {
    agent any

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
                    // Add your build commands here (e.g., Maven, Gradle, npm, etc.)
                    bat 'echo Build successful!'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo 'Running tests...'
                    // Add your test commands here (e.g., pytest, JUnit, etc.)
                    bat 'echo Tests executed successfully!'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo 'Deploying the application...'
                    // Add your deployment steps (e.g., Docker, Kubernetes, SCP, etc.)
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
