pipeline {
    agent any
    environment {
        DOCKERHUB_USERNAME = 'DOCKERHUB'
        DOCKERHUB_PASSWORD = credentials('DOCKERHUB')
    }
    stages {
        stage('Build') {
            steps {
                sh 'chmod +x build.sh'
                sh './build.sh'
            }
        }
        stage('Deploy') {
            when {
                anyOf {
                    branch 'dev'
                    branch 'master'
                }
            }
            steps {
                sh 'chmod +x deploy.sh'
                script {
                    def branch = env.BRANCH_NAME
                    if (branch == 'dev') {
                        sh './deploy.sh dev'
                    } else if (branch == 'master') {
                        sh './deploy.sh prod'
                    } else {
                        error "Invalid branch: $branch"
                    }
                }
            }
        }
    }
}
