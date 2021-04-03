module Views 
    module Bookings
        def self.show(booking:)
            contents = rows_for booking
            table = TTY::Table.new contents
            puts table.render(:ascii, padding: [0, 1, 0, 1])
        end
        def self.rows_for(booking)
            rows = []
            rows << ["Reference number: #{booking.reference}".green]
            rows << ["Booking contact details"] 
            rows << ["    Passenger's name: #{booking.name}"] 
            rows << ["    Age: #{booking.age}"]
            rows << ["    Departure date: #{booking.date}"] 
            rows << ["    Seat class: #{booking.seat_class}"]
            rows << ["Departing from:  Macquarie Space Center"]
            return rows
        end
    end
end
