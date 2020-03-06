pipeline {
   agent any

   stages {
      stage('Retraining') {
         steps {
           
            git 'https://github.com/kalikichandu/ML-Model-Retraining-DevOps-way.git'
            
            dir('Only_CD') {
                // some block               
                    script{
                        sh 'pwd'
                        sh 'ls -lah'
                        //if (fileExists('Retraining.sh')) {
                        //    echo 'Yes'
                        //} 
                       // else {
                       //     echo 'No'
                        //}
                        sh 'Retraining.sh'
                    }
                }
         }         
      }
      stage('Push_Model_to_git')
      {
         steps{
             pwd
             //sh Only_CD/git.sh 2
         }
      }
      stage('Publish_over_SSH')
      {
         steps{
             //sh Only_CD/git.sh
             echo 'Need to publish over SSH'
         }
      }

   }
}
