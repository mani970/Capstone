pipeline {
    agent any
    stages {
        stage('Build and Run Docker Container') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        sh './build.sh build-and-run'
                    }
                }
            }
        }
        stage('Deploy to Docker Hub Dev') {
            when {
                expression { return env.BRANCH_NAME == 'dev' }
            }
            steps {
                sh './deploy.sh dev'
            }
        }
        stage('Deploy to Docker Hub Prod') {
            when {
                expression { return env.BRANCH_NAME == 'master' }
            }
            steps {
                sh './deploy.sh prod'
            }
        }
    }
}
