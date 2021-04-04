require "tty-prompt"
require 'securerandom' #add library 

module Views
    module Bookings
        def self.create
            date = TTY::Prompt.new.select ("Choose departure date") do |menu|
                menu.choice "10 October 2022"
                menu.choice "11 November 2022"
                menu.choice "12 December 2022"
            end
            seat_class = TTY::Prompt.new.select ("Choose your seat class") do |menu|
                menu.choice "First-class"
                menu.choice "Economy"
            end
            begin 
            name = TTY::Prompt.new.ask("What is the passenger's name? ") do |q|
                q.validate (/^[a-zA-Z ]*$/)
            end
            end until !name.nil?
            age = TTY::Prompt.new.ask("How old is the passenger? ") do |q|
                q.validate (/^(1[89]|[2-9]\d)$/)
            end
            
            [name, age, date, seat_class]
        end
    end
end