pipeline {
	agent any
	stages {
		stage('Build') {
			steps {
				sh 'mvn -B -DskipTests clean package'
			}
			post {
				success{
					archiveArtifacts 'target/*.jar'
				}
			}
		}
		stage('Test') {
			steps {
				sh 'mvn test surefire-report:report'
			}
			post {
				always {
					junit 'target/surefire-reports/*.xml'
				}
			}
		}
		stage('Deploy') {
			steps {
				sh 'mvn deploy'
			}
		}
		

		stage('Deliver') {
			steps {
				sh './jenkins/scripts/deliver.sh'
			}
		}
	}
}

