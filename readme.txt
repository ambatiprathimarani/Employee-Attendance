How to run the Employee Attendance System  Project in PHP

1.Download the zip file

2.Extract the file and copy emp-atnd folder

3.Paste inside root directory(for xampp xampp/htdocs, for wamp wamp/www, for lamp var/www/Html)

4.Open PHPMyAdmin (http://localhost/phpmyadmin)

5.Create a database with the name  empattndms

6.Import empattndms.sql file(given inside the zip package in SQL file folder)

7.Run the script http://localhost/emp-atnd

Admin Credential
Username: admin@gmail.com
Password: admin123

Employee Credential
Username: emp123
Password: password123

Allow Access from LAN and Restrict IPs to markattendance
Restrict Access to Specific IPs in mark_attendance.php:
Add IPs to the $allowed_ips array:
 
$allowed_ips = ['192.168.1.100', '192.168.1.101']; // Add your specific IPs here
if (!in_array($_SERVER['REMOTE_ADDR'], $allowed_ips)) {
    die('Access Denied');
}
