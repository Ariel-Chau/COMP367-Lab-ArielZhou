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
        
        stage('Code Coverage (JaCoCo)') {
            steps {
                jacoco(
                      execPattern: 'target/*.exec',
                      classPattern: 'target/classes',
                      sourcePattern: 'src/main/java',
                      exclusionPattern: 'src/test*'
                )
            }
        }
        
        
        
        stage("Build docker image") {
            steps {
                script {
                    bat "docker build -t arielchau/comp367-lab2-arielzhou ."
                }
            }
        }
        
        stage("Push image to hub") {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                        bat 'docker login -u arielchau -p "h@ND!Dr001"'
                    }
                    bat 'docker push arielchau/comp367-lab2-arielzhou '
                }
            }
        }
    }
}
}