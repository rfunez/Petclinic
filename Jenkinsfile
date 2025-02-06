pipeline {
    agent{
        label 'agent1'
    }
     stages{
        stage('test') {
            steps {
                echo "Parametro1: ${params.jdk_version}"
                echo "Parametro2: ${env.jdk_version}"
                echo "Parametro3: ${jdk_version}"
            }
        }
         
     }
     post {
          success {
                 echo 'Build completed ok'
          }
     }

}
