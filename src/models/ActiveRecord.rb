require 'yaml'

class ActiveRecord
    attr_reader :reference
    #retrieve the data in bookings.yml. If not exists, rescue will create a new array
    BOOKINGS = YAML.load(File.read('bookings.yml')) rescue []
    def self.all
        BOOKINGS
    end
    def valid?
        true
    end
    def save!
        raise 'Booking not saved' unless valid?
        @reference = SecureRandom.alphanumeric(6).upcase
        BOOKINGS << self        
        File.open('bookings.yml', 'w') {|file| file.write(BOOKINGS.to_yaml)}
        #this method is to push reference to the array and save
    end
    def self.fetch_reference
        TTY::Prompt.new.ask("Please enter your booking reference: ") do |q|
            q.validate (/^[A-Z0-9]*$/)
        end
    end
    def self.find(reference)
        booking = BOOKINGS.find {|ticket| ticket.reference == reference}
        raise "Invalid booking reference" unless booking
        return booking
    end
    def delete
        return if @reference.nil?
        idx = BOOKINGS.index {|booking| booking.reference == @reference}
        @reference = BOOKINGS[idx] = nil
        BOOKINGS.reject! {|item| item.nil? || item == ""}
        File.open('bookings.yml', 'w') {|file| file.write(BOOKINGS.to_yaml)}
    end
end