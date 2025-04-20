pipeline {
    agent any

    // 1. Configure NodeJS tool (REQUIRED)
    tools {
        nodejs "NodeJS" // Name must match your Jenkins Global Tool Configuration
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/RobloxCoder-12/Quizlet.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                // 2. Use npm.cmd for Windows agents
                bat 'npm.cmd install'
            }
        }

        stage('Build') {
            steps {
                // 3. Actual build command (modify if your build script differs)
                bat 'npm.cmd run build'
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'build/**/*', allowEmptyArchive: false
            }
        }
    }

    post {
        failure {
            echo 'Pipeline failed! Check logs for errors.'
        }
        success {
            echo 'Pipeline executed successfully!'
        }
    }
}
