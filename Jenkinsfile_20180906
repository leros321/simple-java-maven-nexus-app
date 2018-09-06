pipeline {
        agent any
        stages {
                stage('Build') {
                        steps {
                                sh 'mvn -B -DskipTests clean package'
                                script {
                                        VERSION = sh(script: "./jenkins/scripts/version_export.sh", returnStdout: true).trim()
                                        echo "** version: ${VERSION} **"
                                        currentBuild.displayName = "#${env.BUILD_NUMBER}_${VERSION}"
                                        currentBuild.description = "Maven simple application"
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
				sh 'mvn clean verify -P sonar -Dsonar.login=b498f2c253c15e99cdffcf2691fd11522045b4dd'
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

