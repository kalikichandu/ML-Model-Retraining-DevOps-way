pipeline {
    agent any

   stages {
      stage('Clone Retraining Code'){

         steps {
           
            git 'https://github.com/kalikichandu/ML-Model-Retraining-DevOps-way.git'
            sh 'pwd'
            sh 'ls -lah'
            sh 'chmod 700 ${WORKSPACE}/Dockerfile'
         }
      } 

      stage('Retraining') {
         
         agent { dockerfile true }
         steps {
                sh 'pwd'
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
      stage('Push_Model_to_Blob')
      {
         steps{
             script{
             sh 'pwd'
             sh 'chmod 700 ${WORKSPACE}/Only_CD/blob_push.py'
                        //sh 'chmod 700 ${WORKSPACE}/Only_CD/Retraining.sh'
                        sh 'python3 ${WORKSPACE}/Only_CD/blob_push.py'
                        sh 'ls -lah'
             }
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
