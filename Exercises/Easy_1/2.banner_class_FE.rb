# Modify this class so new will optionally let you specify a fixed banner width
# at the time the Banner object is created. The message in the banner should be
# centered within the banner of that width. Decide for yourself how you want to
# handle widths that are either too narrow or too wide.

=begin
P:

Modify this class so that we can now optionally set the width for the banner,
instead of the width being based off the input string. The message should be
centered based off the given width. We can decide how to handle widths that are
too narrow or too wide (terminal output is limited to 80 chars)

Modeling:

We can set an optional with parameter in our `initialize` method

initialize(message, width = 2)

Set min and max width

MIN_WIDTH = 2
MAX_WIDTH = 80

Next we need to format the banner based off this width

Things to consider:
- What if the size of the message is greater than the width?
  - Should output a message saying the message is larger than the width, and
    that the width will be defaulted to the message size + 4

- Need to have a default width
  - What is the width referencing? Is it including the first and last character
    of each line? Or is it only for the space between wall to wall?
    - Space from wall to wall might be most suitable
      - Set default width to 2 to account for empty strings

If message size is greater than max width?
  - can add a conditional within our `to_s` method
    - if its greater output an error message
    - if its less, output the message like normal 
=end

class Banner
  MAX_WIDTH = 80

  attr_reader :message, :width

  def initialize(message, width = 4)
    @message = message
    if width < 4
      @width = 4
    else
      @width = width
    end
  end

  def to_s
    if message.size > MAX_WIDTH || message.size > @width
      "Your message is too long for the specified width."
    else
      [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
    end
  end

  private

  def horizontal_rule
    "+" + ('-' * (@width)) + "+"
  end

  def empty_line
    "|" + (" " * (@width)) + "|"
  end

  def message_line
    "| #{@message.center(width - 2)} |"
  end
end


banner = Banner.new('To boldly go where no one has gone before.', 50)
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('', 50)
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+