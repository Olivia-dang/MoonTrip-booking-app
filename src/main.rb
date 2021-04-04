require "./routes"
require "tty-prompt"
require "tty-table"
require "colorize"
require_relative "./views/intro"

puts "\e[2J\e[f"  #clear screen
Views::Intro.intro
puts 
puts 
begin
    choice = TTY::Prompt.new.select("What would you like to do?") do |menu|
        menu.choice "Create a new booking", 1
        menu.choice "List all bookings", 2
        menu.choice "View your booking", 3
        menu.choice "Modify your booking", 4
        menu.choice "Cancel your booking", 5
        menu.choice "Quit", 6
    end
    Routes.dispatch(choice)
end until choice == 6
