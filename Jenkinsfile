pipeline {
	agent any
	parameters {
		booleanParam(name: 'BUILD_PROJECT', defaultValue: true, 
		description: 'Do we build the project after checkout?')
		booleanParam(name: 'TEST_PROJECT', defaultValue: false, 
		description: 'Do we run the unit tests too?')
	}
	stages {
		stage("Checkout") {
			steps {
				git url: 'https://github.com/ZooLeeCoding/DevopsKurzus_SpringExample.git'
			}
		}
		stage("Compile") {
			environment {NAME = 'szaboz'}
			when { expression { return params.BUILD_PROJECT } }
			steps {
				sh "./gradlew compileJava"
			}
		}
		stage("Unit Test") {
			when { expression { return params.TEST_PROJECT } }
			steps {
				sh "./gradlew test"
			}
		}
	}
	post { always { echo 'The pipeline has ended' } }
}