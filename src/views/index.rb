module Views
    module Bookings
        def self.index(bookings)
            return puts("No one has booked yet") unless bookings.length>0
            table = TTY::Table.new(
                ["Reference", "Passenger's name", "Age", "Departure date", "package"],
                list_for(bookings) 
            )
            puts table.render(:ascii, padding: [0, 1, 0, 1])
        end
        def self.list_for(bookings)
            bookings.map do |booking|
                [booking.reference, booking.date, booking.package, booking.name, booking.age]
            end
        end
    end
end