pipeline {
    agent any

    environment {
        DOCKERHUB = credentials('DOCKERHUB')
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh './build.sh'
            }
        }

        stage('Deploy to Docker Hub') {
            when {
                anyOf {
                    branch 'dev'
                    branch 'master'
                }
            }
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        // Checkout the 'dev' branch
                        git checkout dev
                        sh './deploy.sh'
                    } else if (env.BRANCH_NAME == 'master') {
                        git checkout master
                        sh 'git merge dev'
                        sh './deploy.sh'
                    }
                }
            }
        }
    }
}
