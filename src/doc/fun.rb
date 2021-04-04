HEADER_LINE = "--------------------------------------------------------------"
HEADER_LENGTH = HEADER_LINE.length
def self.clear
    puts "\e[2J\e[f"
end

#call out after a new booking: Loading your new booking...
def loading_animation(string)
    string.length.times do |i|
        clear
        puts string[0, i].center(HEADER_LENGTH)
        sleep(0.2)
    end

end
loading_animation("Loading your flight itinerary...")