pipeline {
    agent any

   stages {
      stage('Clone Retraining Code'){

         steps {
            cleanWs()
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
                        
                        sh 'chmod 700 ${WORKSPACE}/Only_CD/Retraining.sh'
                        //sh 'chmod 700 ${WORKSPACE}/Only_CD/Retraining.sh'
                        sh '${WORKSPACE}/Only_CD/Retraining.sh'
                        sh 'ls -lah'
                        echo "Retraining Completed"
                    }
                    script{
                        echo "Pusing model files to Blob Storage"
                        sh 'pwd'
                        sh 'chmod 700 ${WORKSPACE}/Only_CD/blob_push.py'
                        //sh 'chmod 700 ${WORKSPACE}/Only_CD/Retraining.sh'
                        sh 'python3 ${WORKSPACE}/Only_CD/blob_push.py'
                        sh 'ls -lah'
                     }
                     
             
                
         }
      }
         stage('publish over SSH') {
         steps {
            script{
                
                sh 'chmod 700 ${WORKSPACE}/Only_CD/rf.pkl'
                //sh 'scp ${WORKSPACE}/Only_CD/rf.pkl azure_prod@104.43.164.138:/var/snap/docker/common/var-lib-docker/volumes/ml_vol/_data/models/'
                sh 'scp ${WORKSPACE}/Only_CD/rf.pkl azure_prod@104.43.164.138:/home/azure_prod/'
                //scp /var/lib/jenkins/workspace/DevOps_for_ML@2/Only_CD/rf.pkl azure_prod@104.43.164.138:/home/azure_prod

                echo 'published over SSH'
             }

            
         }         
         
             
         
      }
     
       
      

   }
}
