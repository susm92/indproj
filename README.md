Project created for course at BTH

In order to get started with this project, start by cloning the git-repo to your local machine.
Under the folder sql/ you have ddl.sql och dml.sql for setting up the database used for this repo.

Start by running ddl.sql and make sure that the database is being created, with a user to read data from the sql. In my case I used mySQL and the user called 'user' to be able to run the project.

After you have gone through the ddl.sql, go through the dml.sql in order to create all the procedures used for this project.

The initial connection itself is found under config/db/ in a file called indproj.json, here the connection between my mySQL database and the program is being made.

When the sql environment is up and running, you can go ahead and start the program by using the command `npm start`.
