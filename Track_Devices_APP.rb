# Creation of Track Devices APP

require 'csv'
require 'pry'
require 'date'
require 'colorize'


class Appliances
    def initialize(appliance_type,location,date_of_purchase,warranty_length,serial_no)
        @type = appliance_type
        @location = location
        @date_of_purchase = date_of_purchase
        @warranty_length = warranty_length
        @serial = serial_no
    end
    
    def add_new_device(name_input)
        CSV.open("#{name_input}_List_of_Devices.csv", "a+") do |csv|
            csv << [@type,@location,@date_of_purchase,@warranty_length,@serial]
        end
    end
end




def show_list_of_devices(name_input)
    CSV.foreach("#{name_input}_List_of_Devices.csv", headers: true,header_converters: :symbol).with_index(1) do |row, ln|
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

def calc_warranty_of_devices(product_name,name_input)
    details =[]
    CSV.foreach("#{name_input}_List_of_Devices.csv", headers: true,header_converters: :symbol).with_index(1) do |row, ln|
        
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

def options(name_input)
    puts "Hi, #{name_input}! What would you like to do? \n Press 1 to view device List \n Press 2 to add a new device \n Press 3 to receive a warranty status report \n Press 4 to exit".colorize(:green)
        option_input = gets.chomp.strip.to_i
        
        while option_input != 1 && option_input != 2 && option_input != 3 && option_input != 4
            puts "Error. Invalid option. Please try again.".colorize(:red)
            puts "What would you like to do? \n Press 1 for Device List \n Press 2 for Adding New Device \n Press 3 for Warranty Status Report \n Press 4 to exit".colorize(:green)
                option_input = gets.chomp.strip.to_i
                100.times {print "-"}
                puts()
        end
            
        counter = 0
        while counter == 0
            if option_input == 1
                    100.times {print "="}
                    puts()
                    show_list_of_devices(name_input)
                    puts "What would you like to do? \n Press 1 for Device List \n Press 2 for Adding New Device \n Press 3 for Warranty Status Report \n Press 4 to exit.".colorize(:green)
                        option_input = gets().chomp.strip.to_i
                        100.times {print "-"}
                        puts()
            elsif option_input == 2
                        puts "What type of appliance is your device?".colorize(:blue)
                        device_type_input = gets().chomp.strip
                        puts "Which part of the house is it in?".colorize(:blue)
                        location_input = gets().chomp.strip
                        puts "When did you purchase this device? Enter a valid date.".colorize(:blue)
                        purchase_date_input = nil
                        while purchase_date_input == nil
                            begin
                                purchase_date_input = Date.parse(gets().strip.chomp)
                            rescue  
                                puts "Wrong Date Format. Please try again.".colorize(:red)
                                puts "When did you purchase this device?".colorize(:blue)
                            end 
                        end    
                        puts "How long is your device's warranty? (in years)".colorize(:blue)
                        warranty_length_input = gets.chomp.strip.to_i
                        puts "What is your device's Warranty Serial Number?".colorize(:blue)
                        serial_number_input = gets().chomp.strip
                        Appliances.new(device_type_input,location_input,purchase_date_input,warranty_length_input,serial_number_input).add_new_device(name_input)
                        puts "New Appliance Added. \n #{device_type_input} in #{location_input} purchased on #{purchase_date_input} with warranty number #{serial_number_input} of #{warranty_length_input} years.".colorize(:teal)
                        100.times {print "="}
                        puts "\nWould you like to add another device? \nPress 2 for yes.\nPress 1 to go back and view device list.\nPress 3 for Warranty Status Report.\nPress 4 to exit.".colorize(:green)
                        option_input = gets().chomp.strip.to_i
            elsif option_input == 3
                        puts "Which product would you like to check?".colorize(:blue)
                        product_check_input = gets().chomp
                        product_details = calc_warranty_of_devices(product_check_input, name_input)
                        
                while product_details == []
                            puts "Which product would you like to check?".colorize(:blue)
                            product_check_input = gets().chomp.strip
                            product_details = calc_warranty_of_devices(product_check_input, name_input)
                end
                        purchase_date_calc = Date.parse(product_details[2])
                        warranty_length_calc = product_details[3].to_i * 365
                        warranty_end_date = purchase_date_calc + warranty_length_calc
                        today_date = Date.today
                        
                        warranty_days_left = (warranty_end_date - today_date).to_i
                        puts "Warranty days left = #{warranty_days_left}".colorize(:light_blue)
                        100.times {print "-"}
                        puts()
                        puts "What would you like to do? \n Press 1 for Device List \n Press 2 for Adding New Device \n Press 3 for Warranty Status Report \n Press 4 to exit.".colorize(:green)
                            option_input = gets().chomp.strip.to_i
            elsif option_input == 4
                        puts "Thank you for using our app!".colorize(:magenta)
                        counter += 1
            else
                        puts "Error. Please enter a valid option.".colorize(:red)
                        puts "What would you like to do? \n Press 1 for Device List \n Press 2 for Adding New Device \n Press 3 for Warranty Status Report \n Press 4 to exit.".colorize(:green)
                            option_input = gets().chomp.strip.to_i
                            100.times {print "-"}
                            puts()
                            
            end
        end
end
                
            

#Log into app
puts "          Hello,
Welcome to your device tracking app! \nFor New Users, please press 'Y' to initialise a new tracking list or 'N' if you are an existing user.".colorize(:green)
start_input = gets.chomp.strip.downcase
100.times {print "-"}
puts()

#error prevention. If input by user is neither of the options, they are requested to input their options again until the input matches one of the option
while start_input != "y" && start_input != 'n'
    puts "Error. Invalid option. Please try again.".colorize(:red)
    puts "          Hello,
    Welcome to your device tracking app! \nFor New Users, please press 'Y' to initialise a new tracking list or 'N' if you are an existing user.".colorize(:green)
    start_input = gets.chomp.strip.downcase
    100.times {print "-"}
    puts()
end

if start_input == "y"
    puts "Hi New User! Welcome to your device tracking app!
    Please type in your desired username : ".colorize(:green)
    name_input = gets.chomp.strip.upcase
    puts "Username = #{name_input} ".colorize(:blue)
    100.times {print "-" }
    puts()
    
    CSV.open("#{name_input}_List_of_Devices.csv", "a+") do |csv|
    csv << [:appliance_type, :location, :date_of_purchase, :warranty_length, :serial_number]  
end        
end 

if start_input == "n"
    puts "Welcome back to your device tracking app! \n Please type in your username:"
    name_input = gets.chomp.strip
    
    result = File.exist?("#{name_input}_List_of_Devices.csv")
  
    if result
        
    else
        puts "No such User. New User Created #{name_input}"
        CSV.open("#{name_input}_List_of_Devices.csv", "a+") do |csv|
        csv << [:appliance_type, :location, :date_of_purchase, :warranty_length, :serial_number]  
        end
    end   
end

options(name_input)

