require "tty-prompt"
require 'tty-table'
require 'colorize'

module Views
    module Bookings
        def self.create
            puts "Please keep in mind that this is a non-refundable booking. \nQualified passengers must be from 18 to 99 years old \n \n"
            date = TTY::Prompt.new.select ("Choose departure date") do |menu|
                menu.choice "10 October 2022"
                menu.choice "11 November 2022"
                menu.choice "12 December 2022"
            end
            puts "Package information"
            table = TTY::Table.new [["Luxury".green, "Adventurer".green],["content1","content2"], ["price1", "price2"] ]
            puts table.render(:ascii, padding: [0, 1, 0, 1])
            package = TTY::Prompt.new.select ("Choose your Package") do |menu|
                menu.choice "Luxury"
                menu.choice "Adventurer"
            end
            begin 
            name = TTY::Prompt.new.ask("What is the passenger's name? ") do |q|
                q.validate (/^[a-zA-Z ]*$/)
            end
            end until !name.nil?
            age = TTY::Prompt.new.ask("How old is the passenger? ") do |q|
                q.validate (/^(1[89]|[2-9]\d)$/)
            end
            
            [name, age, date, package]
        end
    end
end