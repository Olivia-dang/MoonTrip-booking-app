module Intro
    def self.loading_effect(string)
        string.length.times do |i|
            #run loading message
            puts string[0, i].center(62)
            sleep(0.2)
            
            puts "We are offering the ultimate space vacation - a 'Fly you to the Moon' trip. \nYou will have unforgettable moments observing the Milky Ways, millions of shining stars, and the whole universe with your own eyes. \nHow fascinating it is when you are one in millions to travel by rocket to space.
            \nWhy not leave your own bootprints on the Moon and write your name \n(if you can manage on the Moon's surface with very weak gravity)
            \nAs a part of the trip, passengers will fly around the Moon's orbit, land on the Moon, and visit International Space Station."

            puts "Duration: 9 days 8 nights"
            puts "The price ticket depends on the package you choose. Spacesuit, food, and drinks are included."
            
        end
    end
end

Intro.loading_effect("Welcome to Moonlight Travel!")