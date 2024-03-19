pipeline {
    agent any
    stages {
        stage('Build and Push Docker Image') {
            steps {
                script {
                    sh 'chmod +x build.sh'
                    sh './build.sh'
                    sh 'docker image ls | grep webpage:v1 || docker build -t mani970/dev/webpage:v1 .'
                    sh 'docker push mani970/dev/webpage:v1'
                }
            }
        }
        stage('Deploy to Docker Hub Dev') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    sh 'chmod +x deploy.sh'
                    withCredentials([usernamePassword(credentialsId: 'mani970', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin'
                        sh './deploy.sh'
                    }
                }
            }
        }
        stage('Deploy to Docker Hub Prod') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'master' && currentBuild.result == 'SUCCESS' && currentBuild.changeSets.any { it.items.any { it.editType == 'ADD' && it.path == 'dev' } }) {
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
    }
}

