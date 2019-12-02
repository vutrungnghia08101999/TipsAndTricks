Install mysql server
===================
```
sudo apt install mysql-server
```

Install mysql workbench
===================
```
sudo apt install mysql-workbench
```

Fix problem:
===================
  1. open terminal
  2. mysql -u root -p (enter)
  3. enter your password
  4. use mysql;
  5. select user, host, plugin from mysql.user;
  6..  update user set plugin='mysql_native_password' where user='root';

  7. update user set Password='Password('my_password') where user='root';
  or (use second command), 
      update user set authentication_string=password('my_password') where user='root'; 
  8. flush privileges;
  7. exit;
  8. service mysql restart

Test
====================
```
myusql -u root -p
```
