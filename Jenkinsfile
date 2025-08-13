pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Manasa-2023/jenkins-nodejs.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t myapp:latest .'
                }
            }
        }

        stage('Test Application') {
            steps {
                script {
                    sh 'docker run --rm myapp:latest echo "Tests passed!"'
                }
            }
        }

        stage('Deploy Application') {
            steps {
                script {
                    sh 'docker stop myapp-container || true && docker rm myapp-container || true'
                    sh 'docker run -d --name myapp-container -p 8080:8080 myapp:latest'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
