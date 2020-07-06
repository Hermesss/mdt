pipeline{
    agent{
        label "linux"
    }
    stages{
        stage('minify'){
            agent any
            tools {nodejs "NodeJS14"}
<<<<<<< HEAD
            when{
                branch 'master'
            }
            steps {
                echo 'run this stage - ony if the branch = master branch'
                sh ''' npm install
                       cd $env.WORKSAPCE/www/js/
                       uglifyjs --compress -- init.js materialize.js modernizr.js  --output out.min.js '''
=======
            //when{
            //    branch 'master'
            //}
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
                archiveArtifacts artifacts: 'www.tar.gz', followSymlinks: false
                   }
        }
        stage (' PR CSS Stylecheck ') {
        //when {
        //        branch 'PR-*'  
        //    }
>>>>>>> parent of 1af9b9e... added When condition

                 
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