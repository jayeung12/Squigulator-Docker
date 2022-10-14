# Squigulator-Docker
A Dockerfile containing Squigulator, an Oxford Nanopore signal simulator

Setup (~10 minutes)
Download Docker Desktop.
Download this GitHub repository's files as a .zip file and unzip it as a new folder.
Open the command line/prompt on your operating system. The next three steps involve entering lines into the command line.
Change the current directory using the command line to the folder you just unzipped with the file "dockerfile" and the folder "FASTA". This command looks something like cd C:\Users\user\Documents\GitHub\ViReMaDocker replacing "C:\Users\user\Documents\GitHub\ViReMaDocker" with your folder path.
Now, build the image with docker build -t virema . -f virema. If you want to add your own data first, add appropriate files to the "src/TestData" folder before building the image. Messages should indicate if everything builds smoothly. Here, the "virema" after "-t" can be replaced with whatever text you would like to name/tag the container with.
You can now make a container using docker run -d -t virema or by going to the "Images" tab in Docker Desktop and hitting "Run" when hovering over the "virema" image.
You can either (a) continue in the operating system command line or (b) use Docker Desktop to open the container's command line. For (b), navigate to the "Containers/Apps" tab with Docker Desktop open. If the container is running, hit "CLI". If the container is stopped, hit the "Start" button first.
(a) Type docker exec -it <container-id> python ./ViReMa.py ./FHV_Genome_padded ./FHV_10k.txt FHV_recombinations.SAM --Seed 20 --MicroInDel_Length 5 -BED --Output_Dir FHV_Test into the operating system command line/prompt replacing "<container-id>" with your container id (use docker container ls and copy the container id for the "virema" container). (b) Type python ./ViReMa.py ./FHV_Genome_padded ./FHV_10k.txt FHV_recombinations.SAM --Seed 20 --MicroInDel_Length 5 -BED --Output_Dir FHV_Test into the "CLI". This command runs the ViReMa algorithm on flock house virus example data. If everything worked, it should produce a folder called "FHV_Test" with a file called "FHV_recombinations.SAM" inside. You can check that this worked with the commands ls followed by cd FHV_Test and one more ls.
If you've been doing option (b), go back to the command line on your operating system. The next two steps involve entering lines into the command line.
With the container still running, use docker container ls and copy the container id for the "virema" container.
Export your files from the container to your computer. Use the command cd C:\Users\user\Documents\Results replacing "C:\Users\user\Documents\Results" with where you want the folder to show up on your local machine. Run docker cp <container-id>:/FHV_Test ., replacing "<container-id>" with the container id from Step 10. The "." puts the files into the local directory we just used "cd" to get into.
When finished, stop the container in Docker Desktop or using the command line (docker stop <container-id>).
