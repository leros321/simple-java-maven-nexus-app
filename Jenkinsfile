pipeline {
	agent any
	stages {
		stage('Build') {
			steps {
				sh 'mvn -B -DskipTests clean package'
			script {
			VERSION = sh(script: "$(mvn help:evaluate -Dexpression=project.version | egrep "^[^\\[]")", returnStdout: true).trim()
			echo "** version: ${VERSION} **"
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

