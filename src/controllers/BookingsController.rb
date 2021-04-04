require_relative "../models/Booking"
require_relative "../views/create"
require_relative "../views/headers"
require_relative "../views/show"
require_relative "../views/index"
require 'yaml'

class BookingsController
    def self.create 
        Headers::clear
        name, age, date, seat_class = Views::Bookings.create
        new_booking = Booking.new(name, age, date, seat_class)
        new_booking.save

        #loading screen
        # Headers::loading_effect("Loading your flight itinerary...")      #remember to uncomment later. mute just for faster test
        
        #display your new booking
        Headers::clear
        Headers::receipt_header
        new_booking.display_booking
        puts Headers::HEADER_LINE
        Headers::return_main_menu
    end

    def self.list
        bookings = Booking::all
        Headers::clear
        Views::Bookings.index(bookings)
        Headers::return_main_menu
    end

    def self.show
        requested_reference = Booking.fetch_reference  
        show_booking = Booking.find(requested_reference) rescue nil
        #fetch_reference and find() is written in ActiveRecord, but Booking < ActiveRecord so it inherits all
        Headers::clear
        Views::Bookings.show booking: show_booking
        Headers::return_main_menu
    end

    def self.delete 
        requested_reference = Booking.fetch_reference  
        booking = Booking.find(requested_reference) rescue nil
        return puts('Invalid reference') unless booking
        booking.delete
        Headers::return_main_menu
    end
    
    # def self.update
    #     requested_reference = Booking.fetch_reference  
    #     booking = Booking.find(requested_reference) rescue nil
    #     name, age, date, seat_class = Views::Bookings.create
               
    #     Views::Bookings.show booking: booking
    # end

end