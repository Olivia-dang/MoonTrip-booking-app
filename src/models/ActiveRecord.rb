require 'yaml'
require 'securerandom'

class ActiveRecord
    attr_reader :reference
    #retrieve the data in bookings.yml. If not exists, rescue will create a new array
    def self.all
        @db ||= begin
            YAML.load(File.read('bookings.yml'))  #database = itself or if it's nil, then YAML.load  
        rescue    
            []
        end
    end
    
    #define class save method
    def self.save(booking)                           
        # yield (all.length + 1)
        all << booking
        File.open('bookings.yml', 'w') {|file| file.write(all.to_yaml)}
        booking
    end
    #define instance save method
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

    def self.delete(booking)
        all.reject! {|item| item.nil? || item == ""}
        File.open('bookings.yml', 'w') {|file| file.write(all.to_yaml)}
    end
    def delete
        return if @reference.nil?
        idx = self.class.all.index {|booking| booking.reference == @reference}
        @reference = self.class.all[idx] = nil
        self.class.delete(self)
    end
end