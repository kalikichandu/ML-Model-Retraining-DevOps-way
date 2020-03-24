pipeline {
   agent {
      dockerfile true
   }

   stages {
      stage('Retraining') {
         steps {
           
            git 'https://github.com/kalikichandu/ML-Model-Retraining-DevOps-way.git'
            
            
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
                        //sh '/var/lib/jenkins/workspace/DevOps_for_ML/Only_CD/Retraining.sh'
                        sh 'chmod 700 ${WORKSPACE}/Only_CD/Retraining.sh'
                        //sh 'chmod 700 ${WORKSPACE}/Only_CD/Retraining.sh'
                        sh '${WORKSPACE}/Only_CD/Retraining.sh'
                        sh 'ls -lah'
                    }
                
         }         
      }
      stage('Push_Model_to_git')
      {
         steps{
             sh 'pwd'
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
