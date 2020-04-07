pipeline {
    agent any

   stages {
      stage('Clone Retraining Code'){

         steps {
            cleanWs()
            git 'https://github.com/kalikichandu/ML-Model-Retraining-DevOps-way.git'
            
            sh 'chmod 700 ${WORKSPACE}/Dockerfile'
            
         }
      } 

      stage('Retraining') {
         
         agent { dockerfile true }
         steps {
                              
                    script{
                        sh 'pwd'
                        
                        sh 'chmod 700 ${WORKSPACE}/Only_CD/train.sh'
                                                
                        sh 'python3 ${WORKSPACE}/Only_CD/train.py'
                        sh 'ls -lah'
                        echo "Retraining Completed"
                    }
                    script{
                        echo "Pusing model files to Blob Storage"
                        
                        sh 'chmod 700 ${WORKSPACE}/Only_CD/blob_push.py'
                        
                        sh 'python3 ${WORKSPACE}/Only_CD/blob_push.py'

                        echo "Pushed to Blob Storage"
                        
                     }
                     script{
                
                        sh 'chmod 700 ${WORKSPACE}/Only_CD/rf.pkl'
                        sh 'scp ${WORKSPACE}/Only_CD/rf.pkl azure_prod@104.43.164.138:/var/snap/docker/common/var-lib-docker/volumes/ml_vol/_data/models/'
     
                        echo 'published over SSH'
                     }
                     
             
                
               }
         }
         
     
       
      

   }
}
