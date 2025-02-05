pipeline {
    agent any 
    
    tools{
        jdk 'jdk11'
        maven 'maven'
    }
    
    environment {
        SCANNER_HOME=tool 'sonar-scanner'
    }
    
    stages{
        
        stage("Git Checkout"){
            steps{
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/jaiswaladi246/Petclinic.git'
            }
        }
        
        stage("Compile"){
            steps{
                sh "mvn clean compile"
            }
        }
        
         stage("Test Cases"){
            steps{
                sh "mvn test"
            }
        }
               
         stage("Build"){
            steps{
                sh " mvn clean install"
            }
        }
        
        stage("Docker Build & Push"){
            steps{
                script{
                   withDockerRegistry(credentialsId: 'docker-registry', toolName: 'docker') {
                        
                        sh "docker build -t image1 ."
                        sh "docker tag image1 rfunez/pet-clinic123:latest "
                        sh "docker push rfunez/pet-clinic123:latest "
                    }
                }
            }
        }
        
        stage("TRIVY"){
            steps{
                sh "id -u"
                sh " trivy image rfunez/pet-clinic123:latest"
            }
        }
        
        stage("Deploy To Tomcat"){
            steps{
                sh "sudo mkdir -p /opt/apache-tomcat-9.0.65/webapps/"
                sh "cp  /home/jenkins/agent/workspace/${env.JOB_NAME}_{env.BRANCH_NAME}/petclinic.war /opt/apache-tomcat-9.0.65/webapps/ "
            }
        }
    }
}
