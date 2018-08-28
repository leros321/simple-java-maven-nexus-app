pipeline {
	agent any
	stages {
		stage('Build') {
			steps {
				sh 'mvn -B -DskipTests clean package'
				sh "COMMIT=${env.GIT_COMMIT}"
			script {
                    currentBuild.displayName = "The name."
                    currentBuild.description = "The best description."
                }

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
	}
}

