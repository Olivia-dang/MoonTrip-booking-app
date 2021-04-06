require 'tty-prompt'

tries = 0
begin
    tries += 1
    print "What is the passenger's name? "
    name = gets.chomp 
    raise NameError, "Invalid name" unless (/^[a-zA-Z .-]*$/).match(name)
    # name = TTY::Prompt.new.ask("What is the passenger's name? ").chomp do |q|
    #     q.validate (/^[a-zA-Z ]*$/)
    #     q.messages[:valid?] = "Invalid name"
    # end
rescue NoMethodError, NameError=> error 
    puts "#{name.inspect} is not a valid name. Please try again \n \n"
    retry if tries < 3
    return
end





# age = TTY::Prompt.new.ask("How old is the passenger? ") do |q|
#     q.validate (/^(1[89]|[2-9]\d)$/)
#     q.messages[:valid?] = "Age should be numbers from 18 to 99"
# end
# tries =0
# class InvalidAge < StandardError
# end
# begin
#     tries += 1
#     print "How old is the passenger? "
#     age = gets
#     raise InvalidAge, "Invalid age" unless (/^(1[89]|[2-9]\d)$/).match(age)
# rescue InvalidAge => error
#     puts "Age must be numbers from 18 to 99"
#     retry if tries < 3
#     return
# end

# age = TTY::Prompt.new.ask("How old is the passenger? ") do |q|
#     q.validate (/^(1[89]|[2-9]\d)$/)
#     q.messages[:valid?] = "Age should be numbers from 18 to 99"
# end