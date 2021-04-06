require 'tty-prompt'

# name = TTY::Prompt.new.ask("What is the passenger's name? ").chomp do |q|
#     q.validate (/^[a-zA-Z ]*$/)
#     q.messages[:valid?] = "Name should be comprised of uppercase, lowercase characters, and space"
# end


    # begin
    
# rescue NoMethodError => error 
#     puts "#{name.inspect} is not a valid name \n \n"
# retry 
# end



# prompt = TTY::Prompt.new
# email = prompt.ask("What is your email?") do |q|
#     q.validate(/\A\w+@\w+\.\w+\Z/)
#     q.messages[:valid?] = "Invalid email address"
# end