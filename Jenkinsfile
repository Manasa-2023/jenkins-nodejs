pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t myapp:latest .'
            }
        }

        stage('Test Application') {
            steps {
                sh 'docker run --rm myapp:latest echo "Tests passed!"'
            }
        }

        stage('Deploy Application') {
    steps {
        sh '''
            docker stop myapp-container || true
            docker rm myapp-container || true
            docker run -d --name myapp-container -p 8081:8080 myapp:latest
        '''
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
