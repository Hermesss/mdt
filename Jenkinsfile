pipeline{
    
    agent{label "linux"}
    stages{
        stage('checkout'){
            steps{
                git 'https://github.com/Hermesss/mdt.git'
            }
        }
        stage (' Test ') {
            
        /*when {
               branch 'PR-*'  
            } */
        environment {
        scannerHome = tool 'SonarQubeScanner'
          }   
    
            steps {
            
            withSonarQubeEnv('sonarqube') {
            sh "${scannerHome}/bin/sonar-scanner\
              -Dsonar.projectKey=mdt \
              -Dsonar.sources=. \
              -Dsonar.host.url=http://10.0.0.6:9000 \
              -Dsonar.login=701a97c279ae8c2ec7389e0751ed69a21a1ef5fd"
                 }
        timeout(time: 3, unit: 'MINUTES') {
            waitForQualityGate abortPipeline: true
                    }
            }

        }
        
        stage('Build'){
            tools {nodejs "NodeJS14"}
            /*when{
                branch 'master'
               } */
            steps {
                echo 'run this stage - ony if the branch = master branch'
                sh ''' npm install -g uglify-js npm install clean-css-cli -g '''
                sh ''' cd ./www/js
                       uglifyjs init.js -o init.min.js
                       cd ../css
                       cleancss -o style.min.css style.css
                       cd ../..
                       echo $PWD
                       tar -czvf www.tar.gz www
                   '''
                   }              
        }
        stage("Archive"){
            steps{
                archiveArtifacts artifacts: 'www.tar.gz', followSymlinks: false
            }
            post{
                
                
                success{
                    echo "====++++Triggering integration++++===="
                    build 'Integration'
                }
                failure{
                    echo "====++++A execution failed Aborting triggering Integration Pipeline++++===="
                }
        
            }
        }
        
    }
}
