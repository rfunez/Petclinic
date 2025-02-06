pipeline {
    agent{
        label 'agent1'
    }
     stages{
         stage('Build') {
            parameters {
                      choice choices: ['jdk11', 'jdk18'], name: 'jdk_version'
            }
            tools{
                maven
                ${params.jdk_version}
            }
            steps {
                 echo 'Building with ${params.jdk_version}'
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