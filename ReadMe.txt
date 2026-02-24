Chapter 8:
----------
Recap from Chapter 7:
1. Build the image:
   docker build -t myapp:1.0 .

2. Check for 1 - check for list of  Images:
   docker images

3. Get image digest:
   docker inspect myapp:1.0 --format='{{index .RepoDigests 0}}'

   Should get something like "myapp@sha256:abc123..."

   Note:  The above command is for PowerShell script, 
   for Windows CLI, the command should be modified to the following:
      docker inspect myapp:1.0 --format="{{index .RepoDigests 0}}"

4. Run the container using either of 2 methods:
   i. By image name and tag-->
      docker run myapp:1.0
   ii. By explicitly using digest-->
      docker run myapp@sha256:abc123

5. To see the last few 'docker run' commands, give either:
   i. For the latest one
      docker ps -l
   ii. For more than the last,
      docker ps -n<no. or lines you deside to see>

6. To see other details, like when container got created and when exited
   (or still running), add '-a' switch, eg.,
   docker ps -l -a
   docker ps -n<no. or lines you deside to see> -a

7. To stop the docker image nd remove it:
   docker stop <container id> -> stops container
   docker rm <image name>   -> removes the image
            or
   docker rmi -f <image name> -> stops container and removes image in 1 go
   eg.,    docker rmi -f myapp:1.0
----------------------------------

Chapter 9:
---------
1. Understand GHCR naming.Image will be stored at:
   ghcr.io/<your-github-username>/<repository-name>:<version tag>
   
   For example,
	ghcr.io/subhadipchowdhury/python-app:1.0


   
   Find the Digest-based reference, see point 3 above.
   Eg,  ghcr.io/subhadipchowdhury/python-app@sha256:abc123...
	

2. Other pre-requisites to be availale:
   ✅ Your repository exists on GitHub
   ✅ Your Dockerfile is committed
   ✅ GitHub Actions is enabled (default for public repos)
   
   No extra account is needed if GitHub account is already present.

3. Authentication Model:
   GitHub Actions automatically provides a temporary token:
   "GITHUB_TOKEN"
   This token:
     i. Can push to GHCR
     ii. Is scoped to the repo
     iii. Is secure
     iv. Rotates automatically

4. Create the GitHub Actions Workflow under .github folder named
   docker-build.yml.







