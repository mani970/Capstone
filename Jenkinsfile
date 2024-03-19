pipeline {
    agent any
    environment {
        REGISTRY = "docker.io"
        IMAGE_NAME = "mani970/dev/webpage"
        IMAGE_NAME_PROD = "mani970/prod/webpage"
        DOCKERHUB_USERNAME = credentials('dockerhub-creds').username
        DOCKERHUB_PASSWORD = credentials('dockerhub-creds').password
    }
    stages {
        stage('Build and push Docker image to dev repo') {
            when {
                branch 'dev'
            }
            steps {
                sh './build.sh'
                sh "docker build -t $IMAGE_NAME:v1 ."
                sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD $REGISTRY"
                sh "docker push $IMAGE_NAME:v1"
            }
        }
        stage('Build and push Docker image to prod repo') {
            when {
                branch 'master'
                changeRequest()
            }
            steps {
                sh './build.sh'
                sh "docker build -t $IMAGE_NAME_PROD:v1 ."
                sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD $REGISTRY"
                sh "docker push $IMAGE_NAME_PROD:v1"
                sh './deploy.sh'
            }
        }
    }
}
