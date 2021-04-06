require 'tty-prompt'

# age = TTY::Prompt.new.ask("How old is the passenger? ") do |q|
#     q.validate (/^(1[89]|[2-9]\d)$/)
#     q.messages[:valid?] = "Age should be numbers from 18 to 99"
# end
tries =0
class InvalidAge < StandardError
end
begin
    tries += 1
    print "How old is the passenger? "
    age = gets
    raise InvalidAge, "Invalid age" unless (/^(1[89]|[2-9]\d)$/).match(age)
rescue InvalidAge => error
    puts "Age must be numbers from 18 to 99"
    retry if tries < 3
    return
end