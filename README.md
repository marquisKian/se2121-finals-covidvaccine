# se2121-finals-covidvaccine


I had to redo the entire codes from the ground-up. It is because that my vscode would not recognize a psql command
in the terminal, hence the reason of me using pgAdmin in the first run. I had asked for help why this was happening 
and my classmates told me that I had to re-install and configure Postgre Sql within local disk C for it to run in VS Code. Fortunately, it did.

Thus I created my tables in the main final.sql file, having to change some data-types as per the advise of my classmates when I showed them my code.
So that it would better fit the allignment of the database.

The next issue was importing the two CSV files. An error would always come up in the terminal 
that the two files cannot be read or had any permission for sql to copy the contents.
I had to change both of them to have access for everyone and every network other than the private one within the properties. 


The three procedures was just having to insert some date from certain tables to the main table. I followed my classmates' advice on using
separate files since my mistake was thinking that they can fit into one file without knowing that they had to be separate. 

Same with the functions files. It has similar format with the PROCEDURE, only I nested certain tables so would only be grouped
by what was needed in the exam. 

The view one, I have stated that there was an error parsing int and varchar even though I used " ::" as casting syntax
