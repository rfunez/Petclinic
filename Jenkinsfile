pipeline {
    agent{
        label 'agent1'
    }
    parameters {
                choice choices: ['jdk11', 'jdk18'], name: 'jdk_version'
    }
     stages{
         stage('Build') {
            tools{
                maven
                script {
                    if ($params.jdk_version == 'jdk11') {
                        return jdk11
                    }
                    else {
                        return jdk18
                    }
                }
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