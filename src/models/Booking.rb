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
        puts "Flight itinerary".center(62)  #HEADER_LENGTH is 62
        puts
        puts "Booking Reference: #{@reference}".green
        puts
        puts "Booking contact details \n Passenger's name: #{@name} \n Age: #{@age}\n Departure date: #{@date} \n Package: #{@package} \n"
        puts
        puts "Departing from:  Macquarie Space Center"
        puts
        puts "Times are local times in Sydney"
        puts 
        puts "If you would like to change information or view your booking, please use the booking reference"
    end    
end