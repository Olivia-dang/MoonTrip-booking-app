require_relative "../models/Booking"
require_relative "../views/create"
require_relative "../views/headers"
require_relative "../views/show"
require_relative "../views/index"
require 'yaml'

class BookingsController
    def self.create 
        Headers::clear
        Headers::main_header
        name, age, date, package = Views::Bookings.create
        begin
            new_booking = Booking.new(name, age, date, package) 
        rescue NoMethodError => error
        return 
        end
        new_booking.save

        #loading screen
        # Headers::loading_effect("Loading your flight itinerary...")      #remember to uncomment later. mute just for faster test
        
        #display your new booking
        display(new_booking)
    end

    
    def self.list
        bookings = Booking::all
        Headers::clear
        Headers::main_header
        Views::Bookings.index(bookings)
        Headers::return_main_menu
    end
    
    def self.show
        requested_reference = Booking.fetch_reference  
        show_booking = Booking.find(requested_reference) rescue nil
        #fetch_reference and find() is written in ActiveRecord, but Booking < ActiveRecord so it inherits all
        Headers::clear
        Headers::main_header
        Views::Bookings.show booking: show_booking
        Headers::return_main_menu
    end
    
    def self.delete 
        puts "Please remember that this is a non-refundable booking, even if you cancel."
        requested_reference = Booking.fetch_reference  
        booking = Booking.find(requested_reference) rescue nil
        return puts('Invalid reference, please key in the correct reference') unless booking
        booking.delete
        Headers::return_main_menu
    end
    
    def self.update
        tmp = requested_reference = Booking.fetch_reference  
        booking = Booking.find(requested_reference) rescue nil
        return puts('Invalid reference, please key in the correct reference') unless booking
        
        #delete this booking and create new content, keeping the same reference
        booking.delete
        name, age, date, package = Views::Bookings.create     
        modified = Booking.new(name, age, date, package)
        modified.update(tmp)
        display(modified)
    end

    def self.display(receipt)
        Headers::clear
        Headers::receipt_header
        receipt.display_booking
        puts Headers::HEADER_LINE
        Headers::return_main_menu
    end
end