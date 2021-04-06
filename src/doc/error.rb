class NotNumberError < StandardError
    def initialize(msg)
      super(msg)
    end
end
class InvalidZeroError < StandardError
    def initialize(msg)
      super(msg)
    end
end

def divide(dividend, divisor)
    begin        
        raise NotNumberError, "Value is not a number" if (!dividend.is_a? Numeric) || (!divisor.is_a? Numeric)
        raise InvalidZeroError, "Divisor cannot be zero" if divisor.zero?
        return dividend/divisor
    rescue NotNumberError, InvalidZeroError => error
        puts "#{error.class}: #{error.message}"

    end   
end

# puts divide(1,0)
puts divide(nil,1)
# puts divide("hi","hello")