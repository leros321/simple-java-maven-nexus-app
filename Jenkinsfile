pipeline {
	agent any
	stages {
		stage('Build') {
			steps {
				sh 'mvn -B -DskipTests clean package'
				sh 'VERSION=$(mvn help:evaluate -Dexpression=project.version | grep "^[^\[]")'
			script {
                    currentBuild.displayName = "#${env.BUILD_NUMBER}_${env.VERSION}"
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

