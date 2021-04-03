require_relative "../models/Booking"
require_relative "../views/create"
require_relative "../views/headers"

class BookingsController
    def self.create 
        Headers::clear
        name, age, date, seat_class = AddNew::create
        new_booking = Booking.new(name, age, date, seat_class)
        new_booking.save!

        #loading screen
        # Headers::loading_effect("Loading your flight itinerary...")      #remember to uncomment later. mute just for faster test
        
        #display flight itinerary
        Headers::clear
        puts "Thank you for your booking"
        Headers::receipt_header
        new_booking.display_booking
        puts Headers::HEADER_LINE
        Headers::return_main_menu
    end
end