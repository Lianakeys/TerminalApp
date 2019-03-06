# Creation of Appliances
require 'csv'
require 'pry'
require 'date'
require 'colorize'

# Log in to app
def start_of_app()
    puts "          Hello,
    Welcome to your device tracking app!
    Please type in your name : ".colorize(:green)
    name_input = gets.chomp.strip.upcase.colorize(:blue).bold
    100.times {print "-"}
    puts "\nWelcome #{name_input} to your device tracking app! \n Press 'Y' for new users to initialize new list or 'N' if you are an existing user.".colorize(:green)
    start_input = gets.chomp.strip.downcase
    100.times {print "-"}
    
    while start_input != "y" && start_input != 'n'
        puts "\nError. Invalid option. Please try again.".colorize(:red)
        puts "\nWelcome #{name_input} to your device tracking app! \n Press 'Y' for new users to initialize or 'N' if you are an existing user.".colorize(:teal)
        start_input = gets.chomp.strip.downcase
        100.times {print "-"}
    end
    #Once user enters Y. Add header in List_of_Devices
    if start_input == "y"
        CSV.open('List_of_Devices.csv', "a") do |csv|
            csv << [:appliance_type, :location, :date_of_purchase, :warranty_length, :serial_number]  
        end
    else
        
    end 
end 

def show_list_of_devices()
        CSV.foreach('List_of_Devices.csv', headers: true,header_converters: :symbol).with_index(1) do |row, ln|
        
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

def calc_warranty_of_devices()
       
       CSV.foreach('List_of_Devices.csv', headers: true, header_converters: :symbol).with_index(1) do |row, ln|
    
        appliance_type = row[:appliance_type]
        location = row[:location]
        date_of_purchase = row[:date_of_purchase]
        warranty_length = row[:warranty_length]
        serial_number = row[:serial_number]
        puts "#{ln} #{appliance_type}, #{location}, #{date_of_purchase}, #{warranty_length}, #{serial_number}".colorize(:cyan)
        return [appliance_type, location, date_of_purchase, warranty_length, serial_number]
    end
    100.times {print "-"}
    puts()

end





def options()
    puts "\nWhat would you like to do? \n Press 1 to view device List \n Press 2 to add a new device \n Press 3 to receive a warranty status report \n Press 4 to exit".colorize(:green)
        option_input = gets.chomp.strip.to_i
        
        while option_input != 1 && option_input != 2 && option_input != 3 && option_input != 4
            puts "\nError. Invalid option. Please try again.".colorize(:red)
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
                    show_list_of_devices()
                    puts "What would you like to do? \n Press 1 for Device List \n Press 2 for Adding New Device \n Press 3 for Warranty Status Report \n Press 4 to exit.".colorize(:green)
                        option_input = gets().chomp.strip.to_i
                        100.times {print "-"}
                        puts()
                    elsif option_input == 2
                        puts "What type of appliance is your device?".colorize(:blue)
                        device_type_input = gets().chomp.strip
                        puts "Which part of the house is it in?".colorize(:blue)
                        location_input = gets().chomp.strip
                        puts "When did you purchase this device? \nEnter Year:".colorize(:blue)
                        purchase_date_year_input = gets().chomp.strip.to_i
                        puts "Enter Month:".colorize(:blue)
                        purchase_date_month_input = gets().chomp.strip.to_i
                        puts "Enter Day:".colorize(:blue)
                        purchase_date_day_input = gets().chomp.strip.to_i
                        purchase_date_input = Date.new(purchase_date_year_input,purchase_date_month_input,purchase_date_day_input)
                        puts "How long is your device's warranty? (in years)".colorize(:blue)
                        warranty_length_input = gets.chomp.strip.to_i
                        puts "What is your device's Warranty Serial Number?".colorize(:blue)
                        serial_number_input = gets().chomp.strip
                        Appliances.new(device_type_input,location_input,purchase_date_input,warranty_length_input,serial_number_input).add_new_device()
                        puts "New Appliance Added. \n #{device_type_input} in #{location_input} purchased on #{purchase_date_input} with warranty number #{serial_number_input} of #{warranty_length_input} years.".colorize(:teal)
                        100.times {print "="}
                        puts "\nWould you like to add another device? \nPress 2 for yes.\nPress 1 to go back and view device list.\nPress 3 for Warranty Status Report.\nPress 4 to exit.".colorize(:green)
                        option_input = gets().chomp.strip.to_i
                    elsif option_input == 3
                        puts "Which product would you like to check?".colorize(:blue)
                        product_check_input = gets().chomp
                        product_details = calc_warranty_of_devices
                        purchase_date_calc = Date.parse(product_details[2])
                        warranty_length_calc = product_details[3].to_i * 365
                        warranty_end_date = purchase_date_calc + warranty_length_calc
                        today_date = Date.today
                        
                        warranty_days_left = (warranty_end_date - today_date).to_i
                        puts "Warranty days left = #{warranty_days_left}".colorize(:light_blue)
                  
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
                
                class Appliances
                    def initialize(appliance_type,location,date_of_purchase,warranty_length,serial_no)
                        @type = appliance_type
                        @location = location
                        @date_of_purchase = date_of_purchase
                        @warranty_length = warranty_length
                        @serial = serial_no
                    end
                    
                    # def description()
                    #     return "#{@type} in #{@location}, bought on #{@DOP}, with warranty #{@serial} ending #{EOW}"
                    # end
                    
                    def add_new_device()
                        CSV.open('List_of_Devices.csv', "a+") do |csv|
                            csv << [@type,@location,@date_of_purchase,@warranty_length,@serial]
                        end
                    end
                end
                
                
                
                start_of_app()
                
                options()
                