pipeline {
    agent any 
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
                sh 'echo Branch Name: $BRANCH_NAME'
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
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
            }
        }
    }
}
