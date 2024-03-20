pipeline {
    agent any

    environment {
        DOCKERHUB = credentials('DOCKERHUB')
    }

    stages {
        stage('Build and Push Docker Image') {
            steps {
                sh './build.sh'
            }
        }

        stage('Deploy to Docker Hub') {
            when {
                anyOf {
                    branch 'dev'
                    branch 'master'
                }
            }
            steps {
                script {
                    sh './deploy.sh'
                }
            }
        }
    }
}
