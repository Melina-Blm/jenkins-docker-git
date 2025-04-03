pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'mon-docker-hub/jenkins-docker-git:latest'
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials'  // ID des credentials Docker Hub dans Jenkins
        SSH_CREDENTIALS_ID = 'server-ssh'  // ID des credentials SSH du serveur distant
        SERVER_USER = 'user'
        SERVER_HOST = 'server-ip'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/ton-repo/jenkins-docker-git.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_IMAGE ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: DOCKER_CREDENTIALS_ID, url: '']) {
                    sh "docker push $DOCKER_IMAGE"
                }
            }
        }

        stage('Deploy to Server') {
            steps {
                sshagent(['server-ssh']) {
                    sh """
                    ssh $SERVER_USER@$SERVER_HOST <<EOF
                        docker pull $DOCKER_IMAGE
                        docker stop app || true
                        docker rm app || true
                        docker run -d --name app -p 80:5000 $DOCKER_IMAGE
                    EOF
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Déploiement réussi !'
        }
        failure {
            echo 'Échec du pipeline.'
        }
    }
}
