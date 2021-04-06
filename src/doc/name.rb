tries = 0
begin
    tries += 1
    print "What is the passenger's name? "
    name = gets.chomp 
    raise NameError, "Invalid name" unless (/^[a-zA-Z .-]*$/).match(name)
    raise NameError, "Name cannot be nil" if name.empty? || name.nil?
rescue NameError=> error 
    puts "#{name.inspect} is not a valid name. Please try again \n"
    retry if tries < 3
    return
end

