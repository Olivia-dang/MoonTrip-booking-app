#this documents will create headers for pages and clear screen 

module Headers 
    def self.clear
        puts "\e[2J\e[f"
    end
    #create a line to separate sections
    HEADER_LINE = "--------------------------------------------------------------"
    HEADER_LENGTH = HEADER_LINE.length
    def self.loading_effect(string)
        string.length.times do |i|
            clear
            puts HEADER_LINE
            puts "Please wait and relax".center(HEADER_LENGTH)
            puts HEADER_LINE
            
            #run loading message
            puts string[0, i].center(HEADER_LENGTH)
            sleep(0.2)
        end
    end
end
