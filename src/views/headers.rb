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
    def self.receipt_header
        puts HEADER_LINE
        puts "Moonlight Travel".center(HEADER_LENGTH)
        puts 
        puts "Address: 7 Kelly Street, Ultimo, NSW 2007, Australia" 
        puts "Email: info.moonlight-travel.com"
        puts "Phone: 13999999"
        puts HEADER_LINE
    end
    # Return to the main menu
    def self.return_main_menu
        puts "\n\n Press any key to go back to the main menu"
        $stdin.getch
        clear
    end
end
