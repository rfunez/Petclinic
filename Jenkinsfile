pipeline {
    agent{
        label 'agent1'
    }
     stages{
        stage('test') {
            steps {
                echo 'Parametro1: ${params.jdk_version}'
                echo 'Parametro2: ${env.jdk_version}'
                echo 'Parametro3: ${jdk_version}'
            }
        }
         /*stage('Build app') {
            tools{
                maven 'maven'
                jdk '${env.jdk_version}'
            }
            steps {
                 echo 'Building with java11'
                 sh 'mvn clean install'
            }
         }
         stage('Stash compiled') {
            steps {
                echo "Stashing compiled"
                stash includes: '**/target/*.war', name: 'compiled'
            }
         }*/
     }
     post {
          success {
                 echo 'Build completed ok'
          }
     }

}