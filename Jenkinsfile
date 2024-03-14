pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "MAVEN3"
    }

    stages {
        stage('Checkout and Build') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'master', url: 'https://github.com/Ariel-Chau/COMP367-Lab-ArielZhou.git'
                // Run Maven with Jacoco for code coverage
                bat "mvn clean org.jacoco:jacoco-maven-plugin:prepare-agent package"
            }
            post {
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.jar'
                }
            }
        }
        
        stage("Code Coverage") {
            steps {
                script {
                    // Publish Jacoco coverage report
                    bat "mvn org.jacoco:jacoco-maven-plugin:report"
                    jacoco(execPattern: 'target/**.exec')
                }
                post {
                    always {
                        // Archive Jacoco reports
                        publishHTML([allowMissing: false, alwaysLinkToLastBuild: true, keepAll: true, reportDir: 'target/site/jacoco', reportFiles: 'index.html', reportName: 'Code Coverage Report'])
                    }
                }
            }
        }
        
        stage("Login to Docker Hub") {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                        bat 'docker login -u arielchau -p "h@ND!Dr001"'
                    }
                }
            }
        }
        
        stage("Build Docker Image") {
            steps {
                script {
                    bat "docker build -t arielchau/comp367-lab2-arielzhou ."
                }
            }
        }
        
        stage("Push Image to Docker Hub") {
            steps {
                script {
                    bat 'docker push arielchau/comp367-lab2-arielzhou '
                }
            }
        }
    }
}