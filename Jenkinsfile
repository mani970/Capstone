pipeline {
    agent any
    environment {
        REGISTRY = "docker.io"
        IMAGE_NAME = "webpage:v1"
        DOCKER_USERNAME = "${secrets.DOKERTOKEN}"
        DOCKER_PASSWORD = credentials('mani970')
        DOCKER_REGISTRY = "${REGISTRY}/${DOCKER_USERNAME}/${env.BRANCH_NAME}"
    }
    stages {
        stage('Build and Push Docker Image') {
            steps {
                script {
                    sh 'chmod +x build.sh'
                    sh './build.sh'
                    sh "docker build -t ${DOCKER_REGISTRY} ."
                    sh "docker push ${DOCKER_REGISTRY}"
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
                    if (env.BRANCH_NAME == 'master' && currentBuild.result == 'SUCCESS' && currentBuild.changeSets.any { it.items.any { it.editType == 'ADD' && it.path =='dev' } }) {
                        sh 'chmod +x build.sh'
                        sh 'chmod +x deploy.sh'
                        withCredentials([usernamePassword(credentialsId: 'mani970', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                            sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin'
                            sh "docker build -t ${REGISTRY}/mani970/prod/${IMAGE_NAME} ."
                            sh "docker push ${REGISTRY}/mani970/prod/${IMAGE_NAME}"
                            sh './deploy.sh'
                        }
                    }
                }
            }
        }
    }
}
