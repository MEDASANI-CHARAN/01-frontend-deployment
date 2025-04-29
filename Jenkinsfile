pipeline {
    agent {
        label 'agent-1'
    }
    options {
                // timeout(time: 100, unit: 'SECONDS')
                timeout(time: 15, unit: 'MINUTES')
                disableConcurrentBuilds()
                ansiColor('xterm')
            }
    parameters {
        string(name: 'appVersion', defaultValue: '1.0.0', description: 'What is the application version?')
    }
    environment {
        def appVersion = ''
        nexusUrl = 'jenkins-nexus.daws2025.online:8081'
    }
    stages {
        stage('print the version'){
            steps {
                script {
                echo "Application version: ${params.appVersion}"
              }
            }
          }
          stage('Init'){
            steps {
               sh """
                    cd 10-frontend
                    terraform init
               """
            }
          }
          stage('Plan'){
            steps {
               sh """
                    cd 10-frontend
                    terraform plan -var="app_version=${params.appVersion}"
               """
            }
          } 
          stage('Deploy'){
             steps {
               sh """
                    cd 10-frontend
                    terraform destrosy -auto-approve -var="app_version=${params.appVersion}"
                """
             }
           }
        }
    post {  
            always { 
                echo 'I will always say Hello again!'
                deleteDir()
            }
            success { 
                echo 'I will run when pipeline sucess'
            }
            failure { 
                echo 'I will run when pipeline failure'
            }
        } 
}
