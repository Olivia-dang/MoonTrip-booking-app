require 'yaml'
require_relative './ActiveRecord'

class Booking < ActiveRecord
    attr_reader :name, :age, :date, :seat_class, :reference
    
    def initialize(name, age, date, seat_class)
        @name = name
        @age = age
        @date = date
        @seat_class = seat_class
    end

    def display_booking
        puts "Flight itinerary"
        puts "Reference number: #{@reference}"
        puts
        puts "Booking contact details \n Passenger's name: #{@name} \n Age: #{age}\n Departure date #{@date} \n Seat class: #{seat_class} \n"
        puts
        puts "Departing from:  Kennedy Space Center"
        puts
        puts "Times are local times in Sydney"
    end    
end