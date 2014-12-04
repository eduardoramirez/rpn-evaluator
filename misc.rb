# misc.rb

=begin
  class InvalidNumberException
    An exception class to specify that 
    the user passed in an invalid number
=end
class InvalidNumberException < RuntimeError
end

=begin
  class NotEnoughException
    An exception class to specify that 
    the user did not pass in the correct amount of 
    arguments
=end
class NotEnoughException < RuntimeError
  attr_reader :mes

  # Initialized the exception with the following message
  def initialize()
    @mes = "Error: Not enough arguments"
   end 
end

=begin
  function atoi
    Converts a string into an integer (fixnum)
  
  @param s - integer in string format to be converted
  @return converted integer
=end
def atoi(s)
  offset = '0'.ord
  neg = false
  sum = 0

  begin
    s.each_byte do |i|
      if i == 45   # the number is negative
        neg = true
        next
      elsif i == 46 # Number is a float, disregard mantissa
        break      
      elsif (i < 48 || i > 57) # Not a valid number
        raise InvalidNumberException, "Error: Invalid Number"
      end

      # Get value of char as int and add to current sum
      tmp = i - offset
      sum = (sum * 10) + tmp
    end 

    # Make number negative if it was originally negative
    return neg ? -sum  : sum

  rescue InvalidNumberException => e
    abort(e.message) # inform user about error
  end
end

=begin
  function atof
    Converts a string into a float

  @param s - float in string format to be converted
  @return converted integer
=end
def atof(s)
  sep = s.split('.')

  integer = atoi(sep[0]) # convert integer to int
  mantissa = atoi(sep[1]) # convert mantissa to int
  neg = false

  # Remember if float is negative
  if integer < 0 
    neg = true
    integer = integer.abs
  end

  mantissaLength = sep[1].length
  place = 10.0 ** mantissaLength

  sum = integer / 1.0  # convert integer to float

  # Add the mantissa to the integer
  for i in 0..mantissaLength-1
    tmp = (mantissa % 10)/place
    sum += tmp
    place /= 10.0
    mantissa /= 10
  end

  sum = neg ? -sum : sum  # Make number negative if necessary

  # Fix funky float operations
  return (sum*(10**mantissaLength)).round / (10.0 ** mantissaLength)
end
