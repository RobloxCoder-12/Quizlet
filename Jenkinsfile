pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/RobloxCoder-12/Quizlet.git'
            }
        }
        stage('Deploy to NGINX') {
            steps {
                script {
                    def nginxPath = 'C:\\nginx\\nginx-1.27.4\\html\\Quizlet'
                    bat "del /S /Q ${nginxPath}\\*"
                    bat "xcopy /E /Y * ${nginxPath}"
                    bat "C:\\nginx\\nginx-1.27.4\\nginx.exe -s reload"
                }
            }
        }
    }
}
