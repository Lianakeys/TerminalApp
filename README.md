App name = Track Device App

Aim = Keep track of all the devices one owns (quantity and quality of device. Eg when open the app, it'll show all information of the devices in the app and makes sorting things easier ie warranty expiry)

Solve real world problem = We have too many devices to keep track of all of them. This app will provide a clear and detailed info necessary. Eg when shopping, able to know what devices owned, the warranty date, status (faulty or not) and amount of years owned/used.

Method of coding = 
1. Creation of appliances   
    use class, file CSV, method
2. Interaction with App
use gets and puts to access the info of devices
    a) view status
    b) add new device
    c) warranty report **
3. Further ideas 
- on/off devices using the app
- set desired temp (eg. oven, aircon)
- recieve alerts and reminders on devices
- if any device > x years, will display and alert to change ASAP(title , shopping needed!)
- For different houses, can initialize diff
- Take pic of warranty paper and store in App(To avoid losing the paper)


Testing the code = 
if else, 
edge case
puts pry
!=


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
 - able to enter 
2. add new device
3. warranty report( how many warranty days left)




