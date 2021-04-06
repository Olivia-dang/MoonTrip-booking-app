require "tty-prompt"
require 'tty-table'
require 'colorize'
require_relative './intro'
module Views
    module Bookings
        class InvalidAge < StandardError
        end
        def self.create
            puts "Please keep in mind that this is a non-refundable booking. \nQualified passengers must be from 18 to 99 years old \n \n"
            date = TTY::Prompt.new.select ("Choose departure date") do |menu|
                menu.choice "10 October 2022"
                menu.choice "11 November 2022"
                menu.choice "12 December 2022"
            end
            
            Views::Intro.package
            package = TTY::Prompt.new.select ("Choose your Package") do |menu|
                menu.choice "Luxury"
                menu.choice "Adventurer"
            end
            #Passenger's name input
            tries = 0
            begin
                tries += 1
                print "What is the passenger's name? "
                name = gets.chomp 
                raise NameError, "Invalid name" unless (/^[a-zA-Z .-]*$/).match(name)
                raise NameError, "Invalid name" if name.empty?
            rescue NameError => error 
                puts "#{name.inspect} is not a valid name. Please try again \n"
                retry if tries < 3
                return
            end
            age_tries= 0
            begin
                age_tries += 1
                print "How old is the passenger? "
                age = gets.chomp
                raise InvalidAge, "Invalid age" unless (/^(1[89]|[2-9]\d)$/).match(age)
            rescue InvalidAge => error
                puts "Age must be numbers from 18 to 99 \n"
                retry if age_tries < 3
                return
            end
            
            [name, age, date, package]
        end
    end
end