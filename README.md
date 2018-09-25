# cliques
Program to get cliques from a users list with twitter followers and github organization

REQUIREMENTS:
You need at least ruby 2.2 and install the next gems:
gem install octokit
gem install twitter

CONFIGURATION:
You need API access for Twitter and user account in Github.
You must configure the credentials in the classes: twitter_handler and github_handler

RUNNING:
The program waits a folder called 'in' with a file called 'in.txt' in the same folder of the project.
The results will be in the folder out also in the same folder that the program.

Execute from console:
ruby main.rb

*Note: The program is extensible and it has a complete suite of unit tests.