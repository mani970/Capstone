pipeline {
    agent any
    triggers {
        githubPush()
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'chmod +x build.sh && ./build.sh'
            }
        }
        stage('Push to DockerHub') {
            when {
                branch 'dev'
            }
            steps {
                echo 'Pushing to DockerHub (dev)..'
                sh 'chmod +x deploy.sh && ./deploy.sh dev'
            }
        }
        stage('Promote to Production') {
            when {
                branch 'master'
            }
            steps {
                echo 'Pushing to DockerHub (prod)..'
                sh 'chmod +x deploy.sh && ./deploy.sh prod'
            }
        }
    }
}
