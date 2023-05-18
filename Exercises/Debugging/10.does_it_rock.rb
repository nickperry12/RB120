# Does It Rock Or Not?

# We discovered Gary Bernhardt's repository for finding out whether something
# rocks or not, and decided to adapt it for a simple example.

class AuthenticationError < StandardError; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    unless valid?(api_key)
      raise AuthenticationError, 'API key is not valid.'
    end

    rand(200_000)
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end

module DoesItRock
  API_KEY = 'LS1A2'

  class NoScore; end

  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY) # ex. 175, 222
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY) # ex. 98, 163

      (positive * 100) / (positive + negative)
    rescue ZeroDivisionError
      NoScore.new
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)

    case score
    when NoScore
      "No idea about #{term}..."
    when 0...40
      "#{term} is not fun."
    when 40...60
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue StandardError => e
    e.message
  end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
puts DoesItRock.find_out('Rain')        # Rain is not fun.
puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!

# In order to test the case when authentication fails, we can simply set API_KEY
# to any string other than the correct key. Now, when using a wrong API key, we
# want our mock search engine to raise an AuthenticationError, and we want the
# find_out method to catch this error and print its error message API key is not
# valid.

# Is this what you expect to happen given the code?

# And why do we always get the following output instead?

# Sushi rocks!
# Rain rocks!
# Bug hunting rocks!

# Solution

=begin
Question 1 "Is this what you expect to happen given the code?" :

The key is valid within the code, so there should be no exceptions raised. If we
were to change the key though, to make it invalid and try and get an error
thrown, we won't get the expected result. Instead we get the output: "No idea
about ... ". This is because the error is rescued within the
`DoesItRock::Score#for_term` class method. The error is rescued and will return
`NoScore`. We expect that the outputs should be "No idea about..." if the
`for_term` method returns `NoScore`. But that is not the case. Part of the
reaosn is because we're returning the class itself, not an object instantiated
of that class. We can change the code on line 38 to `NoScore.new` to remedy
that.

This fixes part of the problem, when `for_term` returns `NewObject.new`, we are
now getting the proper output. But we're still not having an error message
thrown when an invalid API key is used. On line 37, we're are rescuing anything
from the `Exception` class. This is highly discouraged. We could remove the
`rescue` altogether, but there might be other exceptions that need to be rescued
like the `ZeroDivisionError` (something that is reasonable in this context).

To fix this, we can rescue just that -- the `ZeroDivisionError` class instead of
the `Exception` class and all of it's subclasses. With that implemented, our
outputs are working as expected. If the API key is invalid, we are getting an
output of "API key is not valid".

Additionally, if there is no score, we're also getting the desired output of
"No idea about... ". 
=end


# ------------------------------------------------------------------------------

# LS Solution:

=begin
The SearchEngine indeed raises an AuthenticationError, but it never reaches the
DoesItRock::find_out method, because Score::for_term already catches it,
resulting in the return value NoScore.

But if the return value is NoScore, why does the find_out method not print the
message "No idea about #{term}..."? In order to see this, recall how case
statements work. The value of score will be compared with each value in the when
clauses using the === operator. In case of the first when clause, the comparison
is NoScore === score, and since the left-hand side is a class, its
implementation boils down to checking whether score is_a? NoScore. This yields
false when score has the value NoScore, as it is not an instance of the NoScore
class. As a result, we end up with the value of the else clause.

In order to fix this, Score::for_term has to return an instance of the NoScore
class (i.e. NoScore.new), instead of the name of the class itself.

Now, back to the original problem: if the API key is wrong, we want the
AuthenticationError to reach the find_out method. One way to achieve this is to
simply remove the rescue clause in Score::for_term. But this would also prevent
us from rescuing other exceptions, like a possible ZeroDivisionError, which
arguably is a perfect occasion to return no score. In order to solve this, we
decide to rescue only that specific exception within Score::for_term and let all
others through.

With those changes, the code runs as expected. However, there is still one thing
wrong about our code, which is less obvious. And that's the use of Exception.

Exception is the top-most class in Ruby's exception hierarchy and it seems a
straightforward choice to rescue or inherit from. But it's too broad. When
creating custom exceptions and when rescuing exceptions, it's good practice to
always use the subclass StandardError. StandardError subsumes all
application-level errors. The other descendants of Exception are used for
system- or environment-level errors, like memory overflows or program
interruptions. These are the kind of errors your application usually does not
want to throw - and definitely does not want to rescue, they should be handled
by Ruby itself.

Further exploration

You may wish to review this blog article for a refresher on working with Ruby
exceptions and the important difference between Exception and StandardError.

Finally, we shouldn't include sensitive information like API keys as plain text
in our source code. The safest way to store them is using an environment
variable (or a gem that simulates this). Don't worry about that now, though;
just be aware of it.
=end