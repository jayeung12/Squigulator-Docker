# Squigulator-Docker
A Dockerfile containing Squigulator, an Oxford Nanopore signal simulator.

## What is Squigulator
Developed by [Hasindu Gamaarachchi](https://twitter.com/hasindu2008), Squigulator is a tool to simulate Oxford Nanopore data from a variety of platforms. It provides raw signal so basecalling with something like Guppy is required for fastq files.

Check out further details [on Squigulator here](https://github.com/hasindu2008/squigulator).
Documentation on the useful slow5tools for manipulating downstream files is [here](https://github.com/hasindu2008/slow5tools)

## Setup (~10 minutes)
1. Download Docker Desktop.
2. Download this GitHub repository's files as a .zip file and unzip it as a new folder.
3. Open the command line/prompt on your operating system. The next three steps involve entering lines into the command line.
4. Change the current directory using the command line to the folder you just unzipped with the file "dockerfile" and the folder "FASTA". This command looks something like `cd C:\Users\user\Documents\GitHub\Squigulator-Docker` replacing "C:\Users\user\Documents\GitHub\Squigulator-Docker" with your folder path.
5. Now, build the image with `docker build -t squigulator . -f dockerfile` If you want to add your own data first (reference sequence to make signal from), add appropriate files to the "FASTA" folder before building the image. Messages should indicate if everything builds smoothly. Here, the "squigulator" after "-t" can be replaced with whatever text you would like to name/tag the container with.
6. You can now make a container using `docker run -d -t squigulator` or by going to the "Images" tab in Docker Desktop and hitting "Run" when hovering over the "squigulator" image.
7. You can either (a) continue in the operating system command line or (b) use Docker Desktop to open the container's command line. For (b), navigate to the "Containers/Apps" tab with Docker Desktop open. If the container is running, hit "CLI". If the container is stopped, hit the "Start" button first.
8. (a) Make a new directory for your output files with `docker exec -it <container-id> mkdir blow5` and go into the folder using `docker exec -it <container-id> cd blow5`, replacing "<container-id>" with your container id (use `docker container ls` and copy the container id for the "squigulator" container). Type `docker exec -it <container-id> squigulator -x rna-r9-min /FHV_Genome.txt -o out_signal.blow5 -n 100` into the operating system command line/prompt. (b) Make a new directory for your output files with `mkdir blow5` and go into the folder using `cd blow5`. Type `squigulator -x rna-r9-min FHV_Genome.txt -o out_signal.blow5 -n 100` into the "CLI". This command makes 100 reads worth of synthetic MinION R9.4.1 flowcell, direct RNA data using the flock house virus reference genome. You can use `ls` to check if the file outputted in the current directory.
9. If you've been doing option (b), go back to the command line on your operating system. The next two steps involve entering lines into the command line.
10. With the container still running, use docker container ls and copy the container id for the "squigulator" container.
11. Export your files from the container to your computer. Use the command `cd C:\Users\user\Documents\Results` replacing "C:\Users\user\Documents\Results" with where you want the folder to show up on your local machine. Run `docker cp <container-id>:/blow5 .`, replacing "<container-id>" with the container id from Step 10. The "." puts the files into the local directory we just used "cd" to get into.
12. When finished, stop the container in Docker Desktop or using the command line (docker stop <container-id>).

## Using slow5tools
The easiest way to use slow5tools within the docker container is by using the following commands:
`VERSION=v0.7.0
wget "https://github.com/hasindu2008/slow5tools/releases/download/$VERSION/slow5tools-$VERSION-x86_64-linux-binaries.tar.gz" && tar xvf slow5tools-$VERSION-x86_64-linux-binaries.tar.gz && cd slow5tools-$VERSION/`

That sets up the tool for use. From here, you can do tasks like converting blow5 to slow5:
`./slow5tools view /blow5/out_signal.blow5 -o file.slow5`

A full range of tasks is found in the slow5tools documentation.
