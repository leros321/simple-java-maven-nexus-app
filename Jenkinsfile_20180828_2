pipeline {
	agent any
	stages {
		stage('Build') {
			steps {
				sh 'mvn -B -DskipTests clean package'
			script {
			VERSION = sh (mvn help:evaluate -Dexpression=project.version | egrep "^[^\\[]")	
                    currentBuild.displayName = "#${env.BUILD_NUMBER}_${VERSION}"
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

