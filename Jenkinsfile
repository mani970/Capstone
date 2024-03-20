pipeline {
    agent any

    triggers {
        githubPush()
    }

    stages {
        stage('Build') {
            steps {
                sh 'build.sh'
            }
        }

        stage('Deploy') {
            when {
                branch 'master'
            }

            steps {
                sh 'deploy.sh'
            }
        }
    }
}
