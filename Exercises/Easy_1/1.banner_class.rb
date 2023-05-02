# Banner Class

# Behold this incomplete class for constructing boxed banners.
# Complete this class so that the test cases shown below work as intended. You
# are free to add any methods or instance variables you need. However, do not
# make the implementation details public.

#   You may assume that the input will always fit in your terminal window.

=begin
P:

We need to complete the class so that the test cases below have the included
output. We can use and add any methods or instance variables we may need. We
want to keep the implementation details private. So any methods that are added
must be below the `private` method call.

Modeling:

For the top and bottom level, we need to format the size of the strings
 - We have 2 '+' at the start and end, and '-' in between
 
"+" + ('-' * (str.size + 2)) + "+"

We can use this same syntax for the empty lines, replacing '+' with '|'

Also need to format the message string
- the input string needs to be centered
  - centered between the size of the message


=end

class Banner
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+" + ('-' * (message.size + 2)) + "+"
  end

  def empty_line
    "|" + (" " * (message.size + 2)) + "|"
  end

  def message_line
    "| #{@message.center(message.size)} |"
  end
end


banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+