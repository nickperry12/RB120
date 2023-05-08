# Question 2

# We have an Oracle class and a RoadTrip class that inherits from the Oracle
# class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following code?

trip = RoadTrip.new
p trip.predict_the_future

# Because `choices` is also defined within the `RoadTrip` class, it will
# override the `choices` method found within `Oracle`. So when a string is
# concatenated to the string `"You will "` within the `predict_the_future`
# method, it will randomly select an array from the `choices` returned array
# found within the `RoadTrip` class.

# LS Solution

# Now the string returned will be of the form "You will <some trip>" where the
# trip is taken from the choices defined by the choices method of RoadTrip.

# Why does this happen? Doesn't the choices called in the implementation of
# Oracle's predict_the_future look in the Oracle class for a choices method? The
# answer is that since we're calling predict_the_future on an instance of
# RoadTrip, every time Ruby tries to resolve a method name, it will start with
# the methods defined on the class you are calling. So even though the call to
# choices happens in a method defined in Oracle, Ruby will first look for a
# definition of choices in RoadTrip before falling back to Oracle if it does not
# find choices defined in RoadTrip. To see this in action, change the name of
# the choices method in RoadTrip (call it chooses) and see what happens.
