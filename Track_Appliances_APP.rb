# Creation of Track Appliances APP
#To access CSV files
require 'csv'
#Require pry is for double checking any errors in our code.
require 'pry'
#To access date formulas that others have provided online.
require 'date'
#A gem that allows us to change the colors of our font.
require 'colorize'

#Created a class to initialize new appliance
class Appliances
    def initialize(appliance_type,location,date_of_purchase,warranty_length,serial_no)
        @type = appliance_type
        @location = location
        @date_of_purchase = date_of_purchase
        @warranty_length = warranty_length
        @serial = serial_no
    end
#This is a method called add_new-appliance which allows user to append/add new appliance information into CSV file.
    def add_new_appliance(name_input)
        CSV.open("#{name_input}_List_of_Appliances.csv", "a+") do |csv|
            csv << [@type,@location,@date_of_purchase,@warranty_length,@serial]
        end
    end
end

#This method called show_list_of_appliances puts out to user their current appliance information list.
#If headers are present in the CSV file, they wil be converted to symbols and CSV.foreach is used to loop out the information in the CSV file.
#.with_index(1) is used to puts out which row number the appliances are in the CSV file.
def show_list_of_appliances(name_input)
    CSV.foreach("#{name_input}_List_of_Appliances.csv", headers: true,header_converters: :symbol).with_index(1) do |row, ln|
        appliance_type = row[:appliance_type]
        location = row[:location]
        date_of_purchase = row[:date_of_purchase]
        warranty_length = row[:warranty_length]
        serial_number = row[:serial_number]

    puts "#{ln} #{appliance_type}, #{location}, #{date_of_purchase}, #{warranty_length}, #{serial_number}".colorize(:cyan)
end
    100.times {print "-"}
    puts()
end

#This method called calc_warranty_of_appliances allows access to the information in the CSV file eg(date_of_purchase and warranty_length) for calculation in later code.
def calc_warranty_of_appliances(product_name,name_input)
#If the product name is not found in the CSV list, it will return an empty array stored in variable called details and an error message will be puts out.
#If the product is found to match any one in the CSV list, it will return the attributes of the class appliance to the details array.
    details =[]
    CSV.foreach("#{name_input}_List_of_Appliances.csv", headers: true,header_converters: :symbol).with_index(1) do |row, ln|
        
        appliance_type = row[:appliance_type]
        if product_name == appliance_type
            location = row[:location]
            date_of_purchase = row[:date_of_purchase]
            warranty_length = row[:warranty_length]
            serial_number = row[:serial_number]
            puts "#{ln} #{appliance_type}, #{location}, #{date_of_purchase}, #{warranty_length}, #{serial_number}".colorize(:cyan)
            return details = [appliance_type, location, date_of_purchase, warranty_length, serial_number]
        else()
        end    
    end

    if details == []
        puts "The product you typed does not exist, please try again.".colorize(:red)
    end
    return details
end

#This is a method to allow users to interact with the app
def options(name_input)
    puts "Hi, #{name_input}! What would you like to do? \n Press 1 for Appliance List \n Press 2 to Add New Appliance  \n Press 3 for Warranty Status Report \n Press 4 to exit".colorize(:green)
        option_input = gets.chomp.strip.to_i
    #error prevention check if user input is not valid, they will be requested to re-enter their option choice. 
        while option_input != 1 && option_input != 2 && option_input != 3 && option_input != 4
            puts "Error. Invalid option. Please try again.".colorize(:red)
            puts "What would you like to do? \n Press 1 for Appliance List \n Press 2 to Add New Appliance  \n Press 3 for Warranty Status Report \n Press 4 to exit".colorize(:green)
                option_input = gets.chomp.strip.to_i
                100.times {print "-"}
                puts()
        end
     #While loop is used here to allow continuous interaction with the app until user chooses to exit (4). 
        counter = 0
        while counter == 0
            if option_input == 1
                    100.times {print "="}
                    puts()
                    show_list_of_appliances(name_input)
                    puts "What would you like to do? \n Press 1 for Appliance List \n Press 2 to Add New Appliance \n Press 3 for Warranty Status Report \n Press 4 to exit".colorize(:green)
                        option_input = gets().chomp.strip.to_i
                        100.times {print "-"}
                        puts()
            elsif option_input == 2
                        puts "What is your appliance name?".colorize(:blue)
                        appliance_type_input = gets().chomp.strip
                        puts "Which part of the house is it located in?".colorize(:blue)
                        location_input = gets().chomp.strip
                        puts "When did you purchase this appliance? Enter a valid date.".colorize(:blue)
                        purchase_date_input = nil
            #Error prevention check. If date input by user is invalid, they will be prompted to re-enter their date until it is acccepted by Date.parse.
                        while purchase_date_input == nil
                            begin
                                purchase_date_input = Date.parse(gets().strip.chomp)
                            rescue  
                                puts "Wrong Date Format. Please try again.".colorize(:red)
                                puts "When did you purchase this appliance?".colorize(:blue)
                            end 
                        end    
                        puts "How long is your appliance's warranty? (in years)".colorize(:blue)
                        warranty_length_input = gets.chomp.strip.to_i
                        puts "What is your appliance's Warranty Serial Number?".colorize(:blue)
                        serial_number_input = gets().chomp.strip
    #New device information is initialised under Appliance class and is appended to the CSV device list file of that user.
                        Appliances.new(appliance_type_input,location_input,purchase_date_input,warranty_length_input,serial_number_input).add_new_appliance(name_input)
                        puts "New Appliance Added.".colorize(:green).bold
                         puts "#{appliance_type_input} situated in your #{location_input} was purchased on #{purchase_date_input} with warranty number #{serial_number_input} that lasts for #{warranty_length_input} years.".colorize(:yellow)
                        100.times {print "="}
                        puts "\nWould you like to add another appliance \nPress 2 for yes.\nPress 1 to go back and view appliance list.\nPress 3 for Warranty Status Report.\nPress 4 to exit.".colorize(:green)
                        option_input = gets().chomp.strip.to_i
            elsif option_input == 3
                        puts "Which product would you like to check?".colorize(:blue)
                        product_check_input = gets().chomp
                        product_details = calc_warranty_of_appliances(product_check_input, name_input)
       #If the product is not found in the user's CSV file, user is required to retype their selection until it matches one of the appliances in the CSV file list.            
                while product_details == []
                            puts "Which product would you like to check?".colorize(:blue)
                            product_check_input = gets().chomp.strip
                            product_details = calc_warranty_of_appliances(product_check_input, name_input)
                end
            #calling the date_of_purchase from the array and changed to Date.parse format, stored in variable called purchase_date_calc
            #This is the calculaton formula to calculate when the warranty ends and store it in variable warranty_end_date.
                        purchase_date_calc = Date.parse(product_details[2])
                        warranty_length_calc = product_details[3].to_i * 365
                        warranty_end_date = purchase_date_calc + warranty_length_calc
                        today_date = Date.today
             #This is the calculaton formula to calculate how many days are left until the warranty expiry date and store it in variable called warranty_days_left.        
                        warranty_days_left = (warranty_end_date - today_date).to_i
                        puts "Warranty days left = #{warranty_days_left}".colorize(:light_blue)
                        100.times {print "-"}
                        puts()
                        puts "What would you like to do? \n Press 1 for Appliance List \n Press 2 to Add New Appliance \n Press 3 for Warranty Status Report \n Press 4 to exit".colorize(:green)
                            option_input = gets().chomp.strip.to_i
            #This is option(4), which is to allow user to exit the app.
            elsif option_input == 4
                        puts "Thank you for using our app!".colorize(:magenta)
                        counter += 1
            #Error prevention check. When user inputs an invalid option other than option 1, 2, 3 or 4, user will be prompted to re-type their option.
            else
                        puts "Error. Please enter a valid option.".colorize(:red)
                        puts "What would you like to do? \n Press 1 for Appliance List \n Press 2 to Add New Appliance \n Press 3 for Warranty Status Report \n Press 4 to exit".colorize(:green)
                            option_input = gets().chomp.strip.to_i
                            100.times {print "-"}
                            puts()
                            
            end
        end
end
                
            
#Start of app
#Log into app
puts "          Hello,
Welcome to your appliance tracking app! \nFor New Users, please press 'Y' to initialise a new tracking list or 'N' if you are an existing user.".colorize(:green)
start_input = gets.chomp.strip.downcase
100.times {print "-"}
puts()

#error prevention. If input by user is neither of the options, they are requested to input their options again until the input matches one of the option.
while start_input != "y" && start_input != 'n'
    puts "Error. Invalid option. Please try again.".colorize(:red)
    puts "          Hello,
    Welcome to your appliance tracking app! \nFor New Users, please press 'Y' to initialise a new tracking list or 'N' if you are an existing user.".colorize(:green)
    start_input = gets.chomp.strip.downcase
    100.times {print "-"}
    puts()
end
#If user chooses a new user, they will be required to create a new user account with a new CSV file created upon registration.
if start_input == "y"
    puts "Hi New User! Welcome to your appliance tracking app!
    Please type in your desired username : ".colorize(:green)
    name_input = gets.chomp.strip.upcase
    puts "Username = #{name_input} ".colorize(:blue)
    100.times {print "-" }
    puts()
    
    CSV.open("#{name_input}_List_of_Appliances.csv", "a+") do |csv|
    csv << [:appliance_type, :location, :date_of_purchase, :warranty_length, :serial_number]  
end        
end 
#If it's an existing user, they will be greeted with "welcome back" and to access their own CSV file, user is required to type in the old username that matches a current file.
if start_input == "n"
    puts "Welcome back to your appliance tracking app! \n Please type in your username:".colorize(:yellow)
    name_input = gets.chomp.strip
    
    result = File.exist?("#{name_input}_List_of_Appliances.csv")
 #IF username does not match any existing files, a new user will be automatically created and user will be able to proceed to interact with the app. 
    if result
        
    else
        puts "No such User. New User Created #{name_input}"
        CSV.open("#{name_input}_List_of_Appliances.csv", "a+") do |csv|
        csv << [:appliance_type, :location, :date_of_purchase, :warranty_length, :serial_number]  
        end
    end   
end


#calling the method to puts out the option list according to the name_input. 
options(name_input)

