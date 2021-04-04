require 'yaml'
require 'securerandom'

class ActiveRecord
    attr_reader :reference
    #retrieve the data in bookings.yml. If not exists, rescue will create a new array
    def self.all
        @db ||= YAML.load(File.read('bookings.yml'))
        #database = itself or if it's nil, then YAML.load
    end

    def self.save(booking)
        # yield (all.length + 1)
        all << booking
        File.open('bookings.yml', 'w') {|file| file.write(all.to_yaml)}
        booking
    end
    def save
        @reference = SecureRandom.alphanumeric(4).upcase
        self.class.save(self) 
    end

    def self.fetch_reference
        TTY::Prompt.new.ask("Please enter your booking reference: ") do |q|
            q.validate (/^[A-Z0-9]*$/)
        end
    end
    def self.find(reference)
        booking = all.find {|ticket| ticket.reference == reference}
        raise "Invalid booking reference" unless booking
        return booking
    end
    
    # def delete
    #     return if @reference.nil?
    #     idx = BOOKINGS.index {|booking| booking.reference == @reference}
    #     @reference = BOOKINGS[idx] = nil
    #     BOOKINGS.reject! {|item| item.nil? || item == ""}
    #     File.open('bookings.yml', 'w') {|file| file.write(BOOKINGS.to_yaml)}
    # end
end