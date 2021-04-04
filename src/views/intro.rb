require 'colorize'

module Views 
    module Intro 
        def self.intro 
            puts "Welcome to Moonlight Travel\n".center(62)
            puts "We are offering the ultimate space vacation - a 'Fly you to the Moon' trip. \nYou will have unforgettable moments observing the Milky Ways, millions of shining stars, and the whole universe with your own eyes. \nHow fascinating it is when you are one in millions to travel by rocket to space.
            \nWhy not leave your own bootprints on the Moon and write your name \n(if you can manage on the Moon's surface with very weak gravity)
            \nAs a part of the trip, passengers will fly around the Moon's orbit, land on the Moon, and visit International Space Station."

            puts "Duration: 9 days 8 nights"
            puts "The price ticket depends on the package you choose. Spacesuit, food, and drinks are included."
        end
        def self.package
            packages = [
                "       Package information",
                "LUXURY".green,
                "       - Return flight tickets",
                "       - Delux room at Kangaroo spaceship",
                "       - Access to the adjoining ensuite bathroom",
                "       - Price: 5mil AUD",
                " ",
                "ADVENTURER".green,
                "       - Return flight tickets",
                "       - Capsule pod at Kangaroo spaceship",
                "       - Access to public bathroom, no shower",
                "       - Price: 3mil AUD",
                " "
            ]
            packages.each {|item| puts item}
        end
    end
end