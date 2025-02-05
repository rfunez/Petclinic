pipeline {
    agent any 
    
    tools{
        jdk 'jdk18'
        maven 'maven'
    }
    
    environment {
        SCANNER_HOME=tool 'sonar-scanner'
    }
    
    stages{
        stage("Build"){
            steps{
                 echo "Compiling with ${env.JAVA_HOME}"
            }
        }
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
                sh " trivy image rfunez/pet-clinic123:latest"
            }
        }
        
        stage("Deploy To Tomcat"){
            environment {
                        dest = "$HOME/tomcat9.0/webapps"
            }
            steps{
                
                sh "mkdir -p ${env.dest}"
                sh "cp  ${env.WORKSPACE}/target/petclinic.war ${env.dest}"
            }
        }
    }
}
