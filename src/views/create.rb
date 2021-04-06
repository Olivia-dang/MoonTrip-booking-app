require "tty-prompt"
require 'tty-table'
require 'colorize'
require_relative './intro'
module Views
    module Bookings
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
            # begin
                name = TTY::Prompt.new.ask("What is the passenger's name? ").chomp do |q|
                    q.validate (/^[a-zA-Z ]*$/)
                    q.messages[:valid?] = "Name should be comprised of uppercase, lowercase characters, and space"
                end
            # rescue NoMethodError => error 
            #     puts "#{name.inspect} is not a valid name \n \n"
            # retry 
            # end

            age = TTY::Prompt.new.ask("How old is the passenger? ") do |q|
                q.validate (/^(1[89]|[2-9]\d)$/)
                q.messages[:valid?] = "Age should be numbers from 18 to 99"
            end
            
            [name, age, date, package]
        end
    end
end