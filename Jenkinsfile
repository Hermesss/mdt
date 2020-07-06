pipeline{
    agent{
        label "linux"
    }
    stages{
        stage('minify'){
            agent any
            tools {nodejs "NodeJS14"}
            when{
                branch 'master'
            }
            steps {
                echo 'run this stage - ony if the branch = master branch'
                sh ''' npm install
                       cd $env.WORKSAPCE/www/js/
                       uglifyjs --compress -- init.js materialize.js modernizr.js  --output out.min.js '''

                 
                }

            }
        stage("Slylelint"){
            agent any
            steps{
                echo "====++++executing Slylelint++++===="
            }
            
            }
        stage('Archive'){
            agent any
            when{
                branch 'master'
            }
            steps {
                echo 'ARCHIVE run this stage - ony if the branch = master branch'
                }
            }
        }
    }