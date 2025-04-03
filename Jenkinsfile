pipeline {
    agent any

    stages {
        stage('Prepare Environment') {
            steps {
                script {
                    // Ensure Git operations are not blocked due to ownership issues
                    bat 'git config --global --add safe.directory C:/nginx/html/Quizlet'
                }
            }
        }

        stage('Pull Latest Changes') {
            steps {
                script {
                    bat '''
                    cd /d C:\\nginx\\html\\Quizlet
                    git reset --hard
                    git clean -fd
                    git pull origin main
                    '''
                }
            }
        }

        stage('Restart Nginx') {
            steps {
                script {
                    bat '''
                    taskkill /IM nginx.exe /F
                    timeout /t 3
                    start C:\\nginx\\nginx.exe
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful! Visit http://localhost/home.html to see changes.'
        }
        failure {
            echo 'Deployment failed! Check Jenkins logs for errors.'
        }
    }
}
