pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /home/p-api_dep_l/.m2:/root/.m2' 
        }
    }
    stages {
        stage('Build') { 
            steps {
                sh 'git config --global https.proxy http://10.103.152.35:3129'
                sh 'mvn -B -DskipTests clean package' 
            }
        }
    }
}
