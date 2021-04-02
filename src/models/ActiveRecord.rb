require 'yaml'

class ActiveRecord
    attr_reader :reference
    #retrieve the data in bookings.yml. If not exists, rescue will create a new array
    BOOKINGS = YAML.load(File.read('bookings.yml')) rescue []
    def valid?
        true
    end
    def save!
        raise 'Booking not saved' unless valid?
        @reference = SecureRandom.alphanumeric(8).upcase
        BOOKINGS << self        
        File.open('bookings.yml', 'w') {|file| file.write(BOOKINGS.to_yaml)}
        #this method is to push reference to the array and save
    end
    
end