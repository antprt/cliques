# Cliques

Cliques get cliques from a users list with twitter followers and github organization. Considers a relation between users when:  

  - They follow each other in twitter
  - They share some organization in github.
 
Assume that people having the same handle both in Twitter and Github are actually the same
person.

### Installation
Requires ruby 2.2.4

### Gems

You need to install:

```sh
$ gem install octokit
```
```sh
$ gem install twitter
```

### Configuration
You need API access for Twitter and user account in Github. 
You must configure the credentials in the classes: twitter_handler and github_handler

### Execution
The program waits a folder called 'in' with a file called 'in.txt' in the same folder of the project. The results will be in the folder out also in the same folder that the program.

Execute from console: 
```sh
$ ruby /lib/main.rb
```
