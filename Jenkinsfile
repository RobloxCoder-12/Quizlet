pipeline {
    agent any

    stages {
        stage('Pull Latest Changes') {
            steps {
                script {
                    bat '''
                    cd /d C:\\nginx\\html\\Quizlet
                    git reset --hard
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
