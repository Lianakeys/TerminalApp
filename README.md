Github repository link = https://github.com/Lianakeys/TerminalApp

<!-- Description of APP -->
App name = Track Appliances App 

Aim/Purpose = Keeps track of all the appliance a person owns. The app is able to store important information of the appliance (E.g. Date of Purchase, Warranty Period, Warranty Serial Number). It allows for a ease of accessing information of appliances when needed.

Solution to Real World Problems = One owns too many devices to keep track of all of them. This app will provide a clear and detailed information of the devices which can be viewed conveniently when necessary. E.g. when shopping, able to know what devices are currently owned, the warranty date, status.

(Functionality) What we did :
1. Created a class to initialize appliance's information
   - Attributes are appliance_type, location the appliance is found in the house,the date of purchase, the warranty period in years and the warranty serial number.
   - Class methods is used to ensure that the adding of new device information would be constant for all appliances.
2. New method under the class called add_new_appliance
   - We used csv.open to access the csv file and appended the attributes of the newly initialised appliance class into the csv file.
3. Logging into app
   - The app will ask for a username input for existing users so as to retreive their respective appliance CSV list.
   - For new users, a new CSV file will be created.
        -If it's a new user, a new predefined header will be added into the new CSV file.
            CSV.open("#{name_input}_List_of_Appliances.csv", "a+") do |csv|
            csv << [:appliance_type, :location, :date_of_purchase, :warranty_length, :serial_number]  
            end        
   - also an error prevention check is in place to ensure if the input is valid
5. We defined a method to show the CSV file list called show_list_of_appliances
    - We used CSV.foreach do to pull out information according to the header
    - We managed to combine the use of .with_index with the foreach to get row number from CSV file
6. We defined another method to allow users to interact with the app
    user gets to choose between options
    a) view status
        - All the show_list_of_appliances method here to prints out the appliance list to screen
    b) add new appliance
        - Ask user for input regarding the attributes needed to initialise a new Appliance class respectively.
        - Refer to Point 2
    c) Days till Warranty Ends
        - Allows user to input the appliance they would like to see the warranty days left
        - We called the calc_warranty_of_appliances method and store into a variable array to access it 
        - Using the accessed variables, we calculated the warranty days left from today's date for the specific appliance and puts it to screen 
    d) To exit app
        - We used a while loop around the selection of options to continue asking the user for an input until they decide to exit.
        - An error prevention check is in place to ensure that the input is valid

Instruction for use = 
1. When an individual purchased a new product/appliance, he/she can open the terminal app and will be prompted to log in to app.
2. Individual can choose whether they are a new user or an exisiting user.
3. For new users (Y), they will be prompted to create a new username ; For existing users (N), they will be prompted to log in to their old username
4. Both users will then be asked to choose between four options.
5. Option 1 will allow them to access their stored list of appliance information.
6. Option 2 will allow them to register a new appliance into the list.
    6.1. Users will be asked to input information about the appliance 
        - Appliance name
        - Location in the house
        - Date of purchase
        - Warranty period
        - Warranty serial number
7. Option 3 wlll allow them to check whether the specific appliance is still under warranty.
8. Option 4 provides the option for users to quit the app.
9. Any invalid input provided by the user will result in a prompt to re-enter the input again.


Extra fancy stuffs
1. used 100.times {print "-"} method to separate the inputs and code that prints to screen for ease of viewing
2. use gem to colourize waranty dates that are expired
3. used .with_index(1) to prints result to screen in a numbered fashion (starting from index 1)
4. used begin and rescue to prevent error when date input is invalid
5. used alot of while loops to allow users to continuously interact with the app


3. Further ideas 
- on/off devices using the app
- set desired temp (eg. oven, aircon)
- recieve alerts and reminders on devices
- if any device > x years, will display and alert to change ASAP(title , shopping needed!)
- For different houses, can initialize diff
- Take pic of warranty paper and store in App(To avoid losing the paper)
- shows a list of faulty devices (allows user to change their working status of the device)


Testing the code = 
- if else, 
- edge case
- !=
- we used binding.pry to check that the symbols need to be consistent and if coersion is needed, and the header requires a symbol converter
- while loop testing using the negative statement !=

Screenshots = 

![Day1 Github creating repository](https://raw.githubusercontent.com/Lianakeys/TerminalApp/master/Screen%20Shot%202019-03-05%20at%203.52.02%20pm.png)
![Day1 Trello planning work to do](https://raw.githubusercontent.com/Lianakeys/TerminalApp/master/Screen%20Shot%202019-03-05%20at%208.03.57%20pm.png)
![Day2 Trello checking what else to do](https://raw.githubusercontent.com/Lianakeys/TerminalApp/master/Screen%20Shot%202019-03-05%20at%208.06.13%20pm.png)
![Day1 Slack collaborating](https://raw.githubusercontent.com/Lianakeys/TerminalApp/master/Screen%20Shot%202019-03-06%20at%205.51.30%20pm.png)
![Day2 Trello collaborating](https://raw.githubusercontent.com/Lianakeys/TerminalApp/master/Screen%20Shot%202019-03-06%20at%205.56.36%20pm.png)
![Day2 Github list of pull requests](https://raw.githubusercontent.com/Lianakeys/TerminalApp/master/Screen%20Shot%202019-03-06%20at%206.06.03%20pm.png)

Details of design & planning process :
a) PIC
![Brainstorm pic 1](https://raw.githubusercontent.com/Lianakeys/TerminalApp/master/Brainstormpic1.jpg)
![Brainstorm pic 2](https://raw.githubusercontent.com/Lianakeys/TerminalApp/master/Brainstormpic2.jpg)
![Brainstorm pic 3](https://raw.githubusercontent.com/Lianakeys/TerminalApp/master/Brainstormpic3.jpg)

b) diagram/workflow : 

https://github.com/Lianakeys/TerminalApp/blob/master/diagram%20work%20flow.pdf

c) project plan & timeline && screenshots of trello boards : 
![Day1 Trello planning work to do](https://raw.githubusercontent.com/Lianakeys/TerminalApp/master/Screen%20Shot%202019-03-05%20at%208.03.57%20pm.png)
![Day2 Trello checking what else to do](https://raw.githubusercontent.com/Lianakeys/TerminalApp/master/Screen%20Shot%202019-03-05%20at%208.06.13%20pm.png)
![Day2 Trello collaborating](https://raw.githubusercontent.com/Lianakeys/TerminalApp/master/Screen%20Shot%202019-03-06%20at%205.56.36%20pm.png)