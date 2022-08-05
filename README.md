# Initial readme: create resources

## Usage


"Backend"
  - Some initial code (not following exact requirments due to time constraints)
  - A CI pipeline that builds & deploys the docker image to a docker registry registry

  Repo: https://github.com/antoniodellelce/ds-backend
  Docker registry url:

"Frontend"

  - Code not started

"CI/CD"


 Provisioning of AWS resources, for simplicity the following components have been created

 - ec2 instance: serve backend code in a single-node docker swarm service
 - s3 bucket: serve static page of backend - for simplicity I was considering switching to an EC2 where I could have re-used the pipeline I used for backend
   but due to time constraints I was unable to complete the change.

 Repo: https://github.com/antoniodellelce/ds-deploy/

 to run the deployment (tested only on linux) the following two steps need to be done from a Linux (may work in other environments with a few changes to mk/terraform.mk):

   * make init
   * make deploy

 These two steps create and perform an initial deployment of the (backend) application.

 The deployment update is missing due to time constraints, the idea was to add a pipeline for each repo (backend/frontend) to perform the update.



## References

* [s3 bucket module](https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/latest)
