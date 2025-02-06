pipeline {
    agent{
        label 'agent1'
    }
    parameters {
                choice choices: ['jdk11', 'jdk18'], name: 'jdk_version'
    }
     stages{
         stage('Build java 11') {
            /*when {
                 environment name: 'jdk_version', value: 'jdk11'
            }*/
            tools{
                maven
                jdk11
            }
            steps {
                 echo 'Building with java11'
                 sh 'mvn clean install'
            }
         }
         /*stage('Build java 18') {
            when {
                 environment name: 'jdk_version', value: 'jdk18'
            }
            tools{
                maven
                jdk18
            }
            steps {
                 echo 'Building with java18'
                 sh 'mvn clean install'
            }
         }*/
         stage('Stash compiled') {
            steps {
                echo "Stashing compiled"
                stash includes: '**/target/*.war', name: 'compiled'
            }
         }
     }
     post {
          success {
                 echo 'Build completed ok'
          }
     }

}