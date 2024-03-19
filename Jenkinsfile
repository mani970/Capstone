pipeline {
    agent any
    environment {
        REGISTRY = "docker.io"
        IMAGE_NAME = "mani970/dev/webpage"
        IMAGE_NAME_PROD = "mani970/prod/webpage"
    }
    stages {
        stage('Build and push Docker image to dev repo') {
            when {
                branch 'dev'
            }
            steps {
                sh './build.sh'
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh "docker login -u $USERNAME -p $PASSWORD $REGISTRY"
                    sh "docker push $IMAGE_NAME:v1"
                }
            }
        }
        stage('Build and push Docker image to prod repo') {
            when {
                branch 'master'
                changeRequest()
            }
            steps {
                sh './build.sh'
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh "docker login -u $USERNAME -p $PASSWORD $REGISTRY"
                    sh "docker push $IMAGE_NAME_PROD:v1"
                }
                sh './deploy.sh'
            }
        }
    }
}

