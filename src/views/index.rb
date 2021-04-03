module Views
    module Bookings
        def self.index(bookings)
            return puts("No one has booked yet") unless bookings.length>0
            table = TTY::Table.new(
                ["Reference", "Passenger's name", "Age", "Departure date", "seat_class"],
                list_for(bookings) 
            )
            puts table.render(:ascii, padding: [0, 1, 0, 1])
        end
        def self.list_for(bookings)
            bookings.map do |booking|
                [booking.reference, booking.name, booking.age, booking.date, booking.seat_class]
            end
        end
    end
end