pipeline {
    agent any
    environment {
        DOCKERHUB_USERNAME = 'mani970'
        DOCKERHUB_TOKEN = credentials('DOCKERHUB')
        GITHUB_SECRET = '${secrets.DOKERTOKEN}'
        DOCKERHUB_DEV_REPO = 'mani970/dev'
        DOCKERHUB_PROD_REPO = 'mani970/prod'
        DOCKER_IMAGE_NAME = 'webpage:v1'
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE_NAME} .'
            }
        }
        stage('Push to dev') {
            when {
                expression {
                    BRANCH_NAME == 'dev'
                }
            }
            steps {
                sh './build.sh'
            }
            post {
                success {
                    sh './deploy.sh'
                }
            }
        }
        stage('Push to prod') {
            when {
                expression {
                    BRANCH_NAME == 'master'
                }
            }
            steps {
                sh 'docker tag ${DOCKER_IMAGE_NAME} ${DOCKERHUB_PROD_REPO}:latest'
                sh 'docker push ${DOCKERHUB_PROD_REPO}:latest'
            }
        }
    }
}
