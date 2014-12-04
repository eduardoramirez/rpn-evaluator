# stack.rb

=begin 
  class Stack
    Simple stack class that uses an array
    to simulate a LIFO stack
=end
class Stack

  # Creates a new stack with zero elements
  def initialize()
    @stack = Array.new
  end
  
  # Pushes an element to the top of the stack
  def push(el)
    @stack.push(el)
  end

  # Removes the top element from the stack
  def pop
    return @stack.pop
  end

  # Returns the element on top of the stack
  def top()
    return @stack.last
  end

  # Returns the size of the stack
  def size()
    @stack.count
  end

end