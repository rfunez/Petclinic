pipeline {
    agent none

    triggers {
            upstream 'PetClinicBuild'
    }
    stages{
        stage('Unstash') {
            steps {
                 echo 'Unstashing compiled'
                 unstash 'compiled'
            }
        }
        stage('Build image and app') {
            agent {
                dockerfile {
                          additionalBuildArgs '-t petclinic:1.0.0'
                          args '--port 8082:8082 --name petclinic-app --hostname petclinic petclinic:1.0.0'
                          filename 'Dockerfile'
                }
            }
            steps {
                sh 'ps -fu java'
            }
        }
        stage('Check app') {
            steps {
                sh 'docker image ls | grep petclinic'
                sh 'docker ps | grep petclinic'
            }
        }
    }
    
               
}
