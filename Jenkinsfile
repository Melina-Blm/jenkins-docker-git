pipeline {
    agent any  // Exécute sur n'importe quel agent disponible

    stages {
        stage('Checkout') {
            steps {
                // Spécifier explicitement la branche 'main'
                git branch: 'main', url: 'https://github.com/Melina-Blm/jenkins-docker-git'
            }
        }

        stage('Build') {
            steps {
                echo 'Aucune compilation nécessaire pour HTML/CSS/JS'
            }
        }

        stage('Test') {
            steps {
                echo 'Ici, on peut ajouter des tests automatisés si nécessaire'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Déploiement terminé !'
            }
        }
    }
}
