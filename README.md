# Password-Generator
an iOS application to generate n number of passwords of various types

# Description
iOS application developed in swift to generate n number of passowrds of variour strength. The number of passwords to be created are taken as an input from user. A class provides a method that enables creation of a random password of certain length of characters.
Clicking Create passwords button ,the app checks that the user has entered valid number of passwords and has a selected strengh level. If an input is missing, an alert diadlog is shown.The list of passwords are generated in background in a child thread and dispalyed in Table view of second view controller.
Selecting a password from the list should move back to the first screen using Unwind Seague

Demo is as following: (https://youtu.be/YJzczJVJPSY)
