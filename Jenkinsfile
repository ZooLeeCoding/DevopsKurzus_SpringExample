pipeline {
	agent any
	stages {
		stage("Checkout") {
			steps {
				git url: 'https://github.com/ZooLeeCoding/DevopsKurzus_SpringExample.git'
			}
		}
		stage("Package Java") {
			steps {
				sh "./gradlew build"
			}
		}
		stage("LS") {
			steps {
				sh "ls"
				echo "Mappa"
				sh "ls build"
				echo "Libs"
				sh "ls build/libs"
			}
		}
		stage("Docker build") {
			steps {
				sh "docker build -t calculator-example ."
			}
		}
		stage("Docker login") {
			steps {
				sh "docker login --username=szaboz --password=$docker_password"
			}
		}
		stage("Docker push") {
			steps {
			    sh "docker tag calculator-example szaboz/calculator-example"
				sh "docker push szaboz/calculator-example"
			}
		}
		stage("Deploy to staging") {
			steps {
				sh "docker run -d --rm -p 8765:8080 --name calculator szaboz/calculator-example"
			}
		}
		stage("Acceptance test") {
			steps {
			    sleep 60
				sh "./acceptance_test.sh"
			}
		}
	}
	post { 
	    always { 
	        sh 'docker stop calculator' 
	    } 
	}
}
