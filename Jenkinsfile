pipeline {
    agent any
    environment {
        DOCKERHUB_USERNAME = 'DOCKERHUB'
        DOCKERHUB_PASSWORD = credentials('DOCKERHUB_PASSWORD')
        DOCKERHUB_REPO_NAME = 'mani970/dev'
    }
    stages {
        stage('Build') {
            steps {
                sh 'chmod +x build.sh'
                sh './build.sh'
           }
        }
    }
}

post {
    success {
script {
            if(env.BRANCH_NAME == 'dev') {
                env.DOCKERHUB_REPO_NAME = 'mani970/dev'
            }
            else {
                env.DOCKERHUB_REPO_NAME = 'mani970/prod'
            }
            sh "sed -i 's/DOCKERHUB_REPO_NAME/${env.DOCKERHUB_REPO_NAME}/g' deploy.sh"
            sh 'chmod +x deploy.sh'
            sh './deploy.sh'
        }
    }
}
