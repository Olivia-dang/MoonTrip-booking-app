require "./routes"
require "tty-prompt"
require "tty-table"
require "colorize"

puts "Fly me to the moon"
begin
    choice = TTY::Prompt.new.select("What would you like to do?") do |menu|
        menu.choice "Create a new booking", 1
        menu.choice "View your booking", 2
        menu.choice "Edit your booking", 3
        menu.choice "Delete your booking", 4
        menu.choice "List all bookings", 5
        menu.choice "Quit", 6
    end
    Routes.dispatch(choice)
end until choice == 6
