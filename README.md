# ML-Model-Retraining-DevOps-way

## Architecture Diagram

![Architecture](https://github.com/kalikichandu/ML-Model-Retraining-DevOps-way/blob/master/Readme%20Content/ML%20Model%20Retraining%20Flow.png)
 
Whenever the data is available for model Retraining 'Model Retraining Pipeline' can be triggered from Jenkins UI.

We have created a Dockerfile to do the Model Retraining inside a Docker Container.

## Prerequisites for Model  Retraining Pipeline:

•	  Should be able to connect to Prod/QA Server from Jenkins server through SSH without Password.

      Use the below resource to set up Public-Private Key pair Authentication between Prod/QA server and Jenkins server.
  
      https://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
    
• 	Create a Docker Volume in Prod/QA server and have the path ready to move the model file.

   steps:
   
    1.docker  volume create {volume_name}  	
    //Command  to Create Docker Volume
        
    2.docker volume inspect {volume_name}
    //Command to see Docker Volume Path
        
## Model Retraining Steps:
1.	Clean the workspace.
2.	Pull the Model Retraining code to Jenkins Workspace from Github.
3.	Running below steps in Docker Container:

    (a)	Install dependent Python packages
  
    (b)	Initiate the Retraining code which saves the model as Pickle files
  
    (c)	Initiate the code to push the Pickle file to Blob Storage
  
    (d)	SSH the Pickle file to Docker Volume path in Prod/QA server
