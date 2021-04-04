require 'yaml'
require_relative './ActiveRecord'

class Booking < ActiveRecord
    attr_reader :name, :age, :date, :package, :reference
    
    def initialize(name, age, date, package)
        @name = name.capitalize()
        @age = age
        @date = date
        @package = package
    end

    def display_booking
        puts "Itinerary\n".center(62)  #HEADER_LENGTH is 62
        puts "Booking Reference: #{@reference}\n".green
        puts "Booking contact details \n    Passenger's name: #{@name} \n    Age: #{@age}\n    Departure date: #{@date} \n    Package: #{@package} \n"

        puts @package=="Luxury" ? "    Price: 5mil AUD\n" : "    Price: 3mil AUD\n"
        
        puts "\nDeparting from:  Macquarie Space Center\n"
        puts "As a part of the trip, passengers will fly around the Moon's orbit, land on the Moon, and visit International Space Station.\n"
        puts "Duration: 9 days 8 nights\n"
        puts "If you would like to change information or view your booking, please use the booking reference\n"
    end    
end