App name = Track Device App 

Aim = Keep track of all the devices one owns (quantity and quality of device. Eg when user opens the app, it'll show all information of the devices in the app and makes sorting things easier ie display warranty serial no, purchase date, and how many days left till warranty expires etc.)

Solve real world problems = We have too many devices to keep track all at the same time. This app will provide a clear and detailed info and can be viewed conveniently when necessary. Eg when shopping, able to know what devices are currently owned, the warranty date, status.

what we did :
1. Created a class to initialize devices information
   attributes are appliance_type, location the device is found in the house,the date of purchase , and the warranty length(in years), and serial no.
2. New method under the class called add_new_device
   we used csv to append new row of new appliance into csv file
3. Made a method to log in to app called start_of_app
   ask for username and input(for whether is the user an existing user or not)
4. If it's a new user, add a header into list of device file
   using the csv.open method 
   also an error prevention check to ensure if the input is valid

   If not a new user, user can choose from the option list without adding another header

5. We defined a method to show the CSV file list called show_list_of_devices
    we use CSV.foreach to pull out information according to the header
    we managed to combine the use of .with_index with the foreach to get row number from CSV file
6. We defined another method to allow users to interact with the app
    user gets to choose between options
    as well as the error prevention check to ensure if the input is valid
    a) view status
        call the show_list_of_device method here to prints out the devices list to screen
    b) add new device
        ask the question regarding the attributes in the appliance class and we initialize and store the user inputs into a Appliances.new and we added the add_new_device method to append it into the CSV file.
    c) warranty report 
        allows user to input the device they would like to see the warranty days left
        we called the calc_warranty_of_devices method and store into a variable array to access it 
        using the accessed variables, we calculated the warranty days left from today's date for the specific device and puts it to screen 
    d) to exit app
        we used a while loop around the selection of options to continue asking the user for an input until they decide to exit.

extra fancy stuffs
1. used 100.times {print "-"} method to separate the inputs and code that prints to screen for ease of viewing
2. use gem to colourize waranty dates that are expired


3. Further ideas 
- on/off devices using the app
- set desired temp (eg. oven, aircon)
- recieve alerts and reminders on devices
- if any device > x years, will display and alert to change ASAP(title , shopping needed!)
- For different houses, can initialize diff
- Take pic of warranty paper and store in App(To avoid losing the paper)
- shows a list of faulty devices (allows user to change their working status of the device)


Testing the code = 
if else, 
edge case
puts pry
!=
we used binding.pry to check that the symbols need to be consistent and if coersion is needed, and the header requires a symbol converter
while loop testing using the negative statement !=
use if else


Problems :
1. We allowed the user to create new files themselves. This will be a problem if we want to show the full list of devices.

Log in to app
#Welcome = 
1. "Welcome to your device tracking app! Press "Y" to start initializing, or "N" to exit."
2. use gets().chomp.strip.downcase
3. use method to call function
4. use while loop to avoid invalid answer
5. use if to run the initialisation when input is Y, and N to exit the app. 

Define option (allow user to choose what to do next)
ask user what they want to do
if user press 1, 
1. view status
 - they are able to view a list of devices and their current endofwarenty etc
 - able to enter their list of device file to view all the details of his device
2. add new device
- add newly purchased devices, key in details one by one
- store into the csv
3. warranty report( how many warranty days left)
- show how many days left




