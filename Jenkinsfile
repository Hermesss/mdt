pipeline{
    
    agent{ any }
    stages{
        stage('checkout'){
            steps{
                git branch: 'my_specific_branch',
                url: 'https://github.com/Hermesss/mdt.git' 
            }
        }
        stage (' Azure VM provision with TF ') {
            
        environment {
        scannerHome = tool 'terraform'
          }   
    
            steps {
            withCredentials([file(credentialsId: 'terraform.tfvars', variable: 'tfvars')]) {
                        sh "cp \$tfvars terraform.tfvars"
                        } 
            sh  "terraform init -input=false"
            sh "terraform plan -input=false -out tfplan"
                   

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
        }   
        stage("Integration"){
            steps{
                build 'Integration'
            }       
                
        
            }
        }
    }
