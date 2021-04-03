require_relative "../models/Booking"
require_relative "../views/create"
require_relative "../views/headers"
require_relative "../views/show"

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
        Headers::receipt_header
        new_booking.display_booking
        puts Headers::HEADER_LINE
        Headers::return_main_menu
    end
    def self.show
        requested_reference = Booking.fetch_reference  
        show_booking = Booking.find(requested_reference) rescue "Wrong booking reference"
        #fetch_reference and find() is written in ActiveRecord, but Booking < ActiveRecord so it inherits all
        Headers::clear
        Views::Bookings.show booking: show_booking
        Headers::return_main_menu
    end
end