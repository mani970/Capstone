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
                sh 'docker build -t mani970/dev/webpage:v1 .'
                sh './deploy.sh dev'
            }
        }
        stage('Deploy to Docker Hub Prod') {
            when {
                expression { return env.BRANCH_NAME == 'master' }
            }
            steps {
                sh 'docker build -t mani970/prod/webpage:v1 .'
                sh './deploy.sh prod'
            }
        }
    }
}
