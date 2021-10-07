#   Jenkins - Blue Ocean Docker Container Launcher

##  Prerequisites:
-   Operating System: Ubuntu 18.04
-   Docker
-   Docker Compose
-   Git

##  Starting Jenkins

1.  Clone the repository using

  ```bash
  git clone https://github.com/oabuoun/jenkins-blueocean-launcher.git jenkins
  ```

2.  Run the following command in the cloned folder
  ```bash
  cd jenkins
  ```

3.  Run the docker-compose
  ```bash
  docker-compose up -d
  ```

4.  Browse to http://localhost:8080 and wait until the Unlock Jenkins page appears.

5.	Display the Jenkins console log with the command:

  ```bash
  docker logs jenkins-blueocean
  ## or
  docker logs jenkins-blueocean | grep GENERATED
  ## or
  docker exec `docker ps | grep jenkins | awk '{ print $1}' ` cat /var/jenkins_home/secrets/initialAdminPassword
  ```

	This will show the automatically-generated password.

6.	Copy the password from the last step and paste it into the `Administrator password` on the `Unlock Jenkins` page.

7.	After unlocking Jenkins, the Customize Jenkins page appears. On this page, click Install suggested plugins.

  	The setup wizard shows the progression of Jenkins being configured and the suggested plugins being installed. This process may take a few minutes.

8.	Finally, Jenkins asks you to create your first administrator user.

9.	When the Create First Admin User page appears, specify your details in the respective fields and click Save and Finish.

10.	When the Jenkins is ready page appears, click Start using Jenkins.

  ***Notes***

  	This page may indicate Jenkins is almost ready! instead and if so, click Restart.

  	If the page doesn't automatically refresh after a minute, use your web browser to refresh the page manually.

11.	If required, log in to Jenkins with the credentials of the user you just created and you’re ready to start using Jenkins!

##  Stopping Jenkins
When you need to stop Jenkins, run the following command (don't do it stop it right now):

  ```bash
  docker-compose down
  ```

## Reinitialising Jenkins (Delete all data)
  ```bash
  docker-compose stop
  docker-compose rm
  docker volume rm jenkins_jenkins-data
  docker volume rm jenkins_jenkins-docker-certs
  ```

  Then start the setup from Step No. 3

## Resources
1.  https://www.jenkins.io/doc/book/installing/docker/
2.  Misc resources from the Internet
