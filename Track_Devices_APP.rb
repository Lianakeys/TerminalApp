# Creation of Appliances
require 'csv'
require 'pry'
require 'date'

# Log in to app
def start_of_app()
    puts "          Hello,
    Welcome to your device tracking app!
    Please type in your name : "
    name_input = gets.chomp.strip
    100.times {print "-"}
    puts "\nWelcome #{name_input} to your device tracking app! \n Press 'Y' for new users to initialize new list or 'N' if you are an existing user."
    start_input = gets.chomp.strip.downcase
    100.times {print "-"}
    
    while start_input != "y" && start_input != 'n'
        puts "\nError. Invalid option. Please try again."
        puts "\nWelcome #{name_input} to your device tracking app! \n Press 'Y' for new users to initialize or 'N' if you are an existing user."
        start_input = gets.chomp.strip.downcase
        100.times {print "-"}
    end
    #Once user enters Y. Add header in List_of_Devices
    if start_input == "y"
        CSV.open('List_of_Devices.csv', "a") do |csv|
            csv << [:appliance_type, :location, :date_of_purchase, :end_of_warranty, :serial_number, :faulty_devices]  
        end
        CSV.open('Faulty_Devices.csv', "a") do |csv|
            csv << [:appliance_type, :location, :date_of_purchase, :end_of_warranty, :serial_number, :faulty_devicess]   
        end
    else
        
    end 
end 

def show_list_of_devices()
    CSV.foreach('List_of_Devices.csv', headers: true,header_converters: :symbol).with_index(1) do |row, ln|
        
        appliance_type = row[:appliance_type]
        location = row[:location]
        date_of_purchase = row[:date_of_purchase]
        end_of_warranty = row[:end_of_warranty]
        serial_number = row[:serial_number]
        puts "#{ln} #{appliance_type}, #{location}, #{date_of_purchase}, #{end_of_warranty}, #{serial_number}"
    end
    
    100.times {print "-"}
    puts()
end





def options()
    puts "\nWhat would you like to do? \n Press 1 to view device List \n Press 2 to add a new device \n Press 3 to receive a warranty status report \n Press 4 to exit"
        option_input = gets.chomp.strip.to_i
        
        while option_input != 1 && option_input != 2 && option_input != 3 && option_input != 4
            puts "\nError. Invalid option. Please try again."
            puts "What would you like to do? \n Press 1 for Device List \n Press 2 for Adding New Device \n Press 3 for Warranty Status Report \n Press 4 to exit"
                option_input = gets.chomp.strip.to_i
                100.times {print "-"}
                puts()
            end
            
            counter = 0
            while counter == 0
                if option_input == 1
                    100.times {print "="}
                    puts()
                    show_list_of_devices()
                    puts "What would you like to do? \n Press 1 for Device List \n Press 2 for Adding New Device \n Press 3 for Warranty Status Report \n Press 4 to exit."
                        option_input = gets().chomp.strip.to_i
                        100.times {print "-"}
                        puts()
                    elsif option_input == 2
                        puts "What type of appliance is your device?"
                        device_type_input = gets().chomp.strip
                        puts "Which part of the house is it in?"
                        location_input = gets().chomp.strip
                        puts "When did you purchase this device? \nEnter Year:"
                        purchase_date_year_input = gets().chomp.strip.to_i
                        puts "Enter Month:"
                        purchase_date_month_input = gets().chomp.strip.to_i
                        puts "Enter Day:"
                        purchase_date_day_input = gets().chomp.strip.to_i
                        purchase_date_input = Date.new(purchase_date_year_input,purchase_date_month_input,purchase_date_day_input)
                        puts "How long is your device's warranty? (in years)"
                        warranty_length_input = gets.chomp.strip.to_i
                        puts "What is your device's Warranty Serial Number?"
                        serial_number_input = gets().chomp.strip
                        Appliances.new(device_type_input,location_input,purchase_date_input,warranty_length_input,serial_number_input).add_new_device()
                        puts "New Appliance Added. \n #{device_type_input} in #{location_input} purchased on #{purchase_date_input} with warranty number #{serial_number_input} of #{warranty_length_input} years."
                        100.times {print "="}
                        puts "\nWould you like to add another device? \nPress 2 for yes.\nPress 1 to go back and view device list.\nPress 3 for Warranty Status Report.\nPress 4 to exit."
                        option_input = gets().chomp.strip.to_i
                    elsif option_input == 3
                        warranty_end_date = purchase_date_input - warranty_length_input
                        puts warranty_end_date
                    elsif option_input == 4
                        puts "Thank you for using our app!"
                        counter += 1
                    else
                        puts "Error. Please enter a valid option."
                        puts "What would you like to do? \n Press 1 for Device List \n Press 2 for Adding New Device \n Press 3 for Warranty Status Report \n Press 4 to exit."
                            option_input = gets().chomp.strip.to_i
                            100.times {print "-"}
                            puts()
                            
                        end
                    end
                end
                
                class Appliances
                    def initialize(appliance_type,location,date_of_purchase,end_of_warranty,serial_no)
                        @type = appliance_type
                        @location = location
                        @DOP = date_of_purchase
                        @EOW = end_of_warranty
                        @serial = serial_no
                    end
                    
                    # def description()
                    #     return "#{@type} in #{@location}, bought on #{@DOP}, with warranty #{@serial} ending #{EOW}"
                    # end
                    
                    def add_new_device()
                        CSV.open('List_of_Devices.csv', "a+") do |csv|
                            csv << [@type,@location,@DOP,@EOW,@serial]
                        end
                    end
                end
                
                
                
                start_of_app()
                
                options()
                