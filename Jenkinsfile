pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                // Checkout source code from GitHub repository
                git url: 'https://github.com/Ariel-Chau/COMP367-Lab-ArielZhou.git'
                
                // Build Maven project
                sh 'mvn clean package'
            }
        }
        
    }
}