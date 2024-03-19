pipeline {
    agent any
    stages {
        stage('Build and Push Docker Image') {
            when {
                branch 'dev'
            }
            steps {
                sh 'chmod +x build.sh'
                sh './build.sh'
            }
        }
        stage('Deploy to Docker Hub Dev') {
            when {
                branch 'dev'
            }
            steps {
                sh 'chmod +x deploy.sh'
                withCredentials([usernamePassword(credentialsId: 'mani970', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin'
                    sh './deploy.sh'
                }
            }
        }
        stage('Deploy to Docker Hub Prod') {
            when {
                branch 'master'
            }
            steps {
                sh 'chmod +x build.sh'
                sh 'chmod +x deploy.sh'
                withCredentials([usernamePassword(credentialsId: 'mani970', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin'
                    sh 'docker build -t mani970/prod/webpage:v1 .'
                    sh 'docker push mani970/prod/webpage:v1'
                    sh './deploy.sh'
                }
            }
        }
    }
}
