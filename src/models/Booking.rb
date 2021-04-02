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

    # def display_booking

    # end    
end