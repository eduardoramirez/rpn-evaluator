# rpn.rb

require_relative 'stack'
require_relative 'misc'

=begin
  function parseString
    Parses the expression into a nice array.
  
  @param s - string to be parsed into an array
  @return array containing parsed valyes
=end
def parseString(s)
  # s is empty or whitespace
  raise NotEnoughException if s == nil || s =~ /^\s*$/

  tokens = Array.new
  tmp = ""
  i = 0

  # Parse each number or operation 
  while i < s.length do
    
    # Skip over whitespace
    if s[i] == ' ' && tmp == ""
      i += 1
      next
    # Add token to array
    elsif s[i] == ' '
      tokens.push(tmp)
      tmp = ""
      i += 1
      next
    elsif s[i] == nil
      break
    end

    tmp += s[i] # concat numbers together (ie " 12 " => 12)
    i+=1
  end

  tokens.push(tmp) if tmp != ""  # add last token to array
  
  return tokens
end

=begin
  function calc
    Evaluates an operation. Requires to operands and
    returns those to the correct operator. Verifies that
    there are enough operands.
=end
def calc e, e2
  raise NotEnoughException if e == nil || e2 == nil
  yield e2, e
end

=begin
  function evalRPN
    Evaluates an reverse polish notation expression

    @Param exp - RPN expression
    @Return answer
=end
def evalRPN(exp)
  begin
    expr = parseString(exp)  # Parse expression into array

    stack = Stack.new  # stack to keep track of operands

    # convert string to int or float
    case expr[0]
      when /\.{1}/
        stack.push(atof(expr[0]))
      else
        stack.push(atoi(expr[0]))
    end

    for i in 1..expr.length

      # Addition - perform addition on previous two operands
      if expr[i] == '+' 
        stack.push(calc stack.pop, stack.pop, &:+)

      # Subtraction - perform subtraction on previous two operands
      elsif expr[i] == '-'
        stack.push(calc stack.pop, stack.pop, &:-)    

      # Division - perform division on previous two operands
      elsif expr[i] == '/'
        stack.push(calc (stack.pop/1.0), stack.pop, &:/)

      # Multiplication - perform mult on previous two operands
      elsif expr[i] == '*'
        stack.push(calc stack.pop, stack.pop, &:*)

      # Just a number -- add to stack
      else
        next if expr[i] == nil  # dont add nil to stack

        case expr[i]
          when /\.{1}/
            stack.push(atof(expr[i]))
          else
            stack.push(atoi(expr[i]))
        end
      end
    end

    # No operator provided
    raise NotEnoughException if stack.size != 1
    
    return stack.pop  # Return answer

  rescue NotEnoughException => e
    abort(e.mes)  # inform user of error
  end

end
   
# Drive for the program
puts evalRPN(ARGV[0]) 