pipeline {
	agent any
	stages {
		stage ('Build') {
			steps {
				script{
					try {
						fileExistes '/var/www/html/jenkins/*.html'	
					}
					catch (exc){
						sh 'mkdir -p /var/www/html/jankins/'
					}
				}
				cleanWs()
				git 'https://github.com/designmodo/Flat-UI'
				sh 'cp $WORKSPACE/* /var/www/html/jenkins/'
			}
		}
		stage ('Teste') {
			steps{
				sh '''#!/bin/bash
					if [ $(($RANDOM%2)) == 0 ]; then
  						echo "Aplicação OK"
  						exit 0
					else
  						echo "Aplicação Falhou"
  						exit 1
				fi'''
			}
		}
		stage ('Deploy') {
			steps{
				sh 'rpm -qa | grep httpd || sudo yum install httpd -y'
				sh 'sudo httpd -k restart'
			}
		}
	}
	post {
		always {
			chuckNorris()
		}
	}
}
