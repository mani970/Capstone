pipeline {
    agent any
    stages {
        stage('Build and Run Docker Container') {
            steps {
                sh './build.sh build-and-run'
            }
        }
        stage('Deploy to Docker Hub Dev') {
            when {
                expression { return env.BRANCH_NAME == 'dev' }
            }
            steps {
                sh './build.sh deploy --repository dev'
            }
        }
        stage('Deploy to Docker Hub Prod') {
            when {
                expression { return env.BRANCH_NAME == 'master' }
            }
            steps {
                sh './build.sh deploy --repository prod'
            }
        }
    }
}
