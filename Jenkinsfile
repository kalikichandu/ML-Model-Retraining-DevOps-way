pipeline {
   agent any

   stages {
      stage('Retraining') {
         steps {
           
            //git 'https://github.com/kalikichandu/ML-Model-Retraining-DevOps-way.git'
            
            dir('ML-Model-Retraining-DevOps-way') {
                // some block               
                  sh Only_CD/Retraining.sh
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
