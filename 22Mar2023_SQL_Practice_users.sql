-- we set up our database connections using the root user (full access to everything!! not secure!)

-- to create a new user
-- create user 'username'@'ipaddress' identified by 'password';
create user 'comp_user'@'localhost' identified by 'comppassword';

-- to give the user access, list the commands and specify the database/table you want them to have access to
-- grant <list of commands, comma separated> on <database.table> to 'user'@'ipaddress';
grant select, update, delete on Company.* to 'comp_user'@'localhost';

-- to access the database as the user, go back to MySQL Workbench home and add a new connection
-- enter the a name for the connection at the top, and the user name where prompted (for now we are leaving the location as localhost)
-- then when you use this connection it will ask for the password that you set when creating the user