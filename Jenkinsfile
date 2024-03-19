pipeline {
    agent any
    stages {
        stage('Build and Push Docker Image') {
            when {
                anyOf {
                    branch 'dev'
                }
            }
            steps {
                sh 'chmod +x build.sh'
                sh './build.sh'
            }
        }
        stage('Deploy to Docker Hub Dev') {
            when {
                anyOf {
                    branch 'dev'
                }
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
                script {
                    // Check if the current branch is the result of merging the dev branch
                    if (currentBuild.rawBuild.changeSet.items.empty == false && currentBuild.rawBuild.changeSet.items[0].affectedFiles.any { it.editType == 'A' && it.path == 'dev' }) {
                        // If so, build and push the Docker image to the prod repo
                        sh 'chmod +x build.sh'
                        sh 'chmod +x deploy.sh'
                        withCredentials([usernamePassword(credentialsId: 'mani970', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]){
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
