# class AbdsfewError < StandardError
# end

# def validate_name(name)
#     name = name.strip
#     raise AbdsfewError, 
#         "Name must not be empty" if name.empty?
#     name
# end

# validate_name ""


class NotNumberError < StandardError
end
class InvalidZeroError < StandardError
end

def divide(dividend, divisor)
    begin   
        dividend = dividend 
        divisor = divisor
        raise NotNumberError, 
            "Value is not a number" if (!dividend.is_a? Numeric) || (!divisor.is_a? Numeric)
        raise InvalidZeroError, 
            "Divisor cannot be zero" if divisor.zero?
        return dividend/devisor
    end
end

# puts divide(1,0)
# puts divide(nil,1)
puts divide("hi","hello")