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
                    // Check if the current branch is 'dev'
                    if (env.BRANCH_NAME == 'dev') {
                        // Checkout the 'dev' branch
                        git checkout dev
                        // Build and push the Docker image to the 'dev' repository
                        sh './deploy.sh'
                    } else if (env.BRANCH_NAME == 'master') {
                        // Checkout the 'master' branch
                        git checkout master
                        // Merge the 'dev' branch into 'master'
                        sh 'git merge dev'
                        // Build and push the Docker image to the 'prod' repository
                        sh './deploy.sh'
                    }
                }
            }
        }
    }
}
