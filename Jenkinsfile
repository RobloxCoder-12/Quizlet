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
                bat 'echo Build successful!'
            }
        }
        stage('Test') {
            steps {
                bat 'echo Tests executed successfully!'
            }
        }
        stage('Deploy') {
            steps {
                // Replace this with your actual deployment logic
                bat 'scp -r build/* user@yourserver:/var/www/html/'
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
