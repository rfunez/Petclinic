pipeline {
    agent{
        label 'agent1'
    }
     stages{
         stage('Build app') {
            tools{
                maven 'maven'
                jdk '${params.jdk_version}'
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
         }
     }
     post {
          success {
                 echo 'Build completed ok'
          }
     }

}