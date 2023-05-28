# What are collaborator objects, and what is the purpose of using them in OOP?
# Give an example of how we would work with one

=begin
Collaborator objects are objects that are stored as a state within another
object, and they work in collaboration with the class that object is associated
with. We use collaborator objects as a means of modeling relationships between
different objects. For example, we're designing an RPG style video game where we
have a playable character; we can use a `Character` class for this. Our playable
character will have some sort of weapon, e.g, a sword, that will help him on his
quests battling various monsters. For this, we can define a `Sword` class. We
can have an instance variable `@weapon_of_choice` in the `Character` class,
which we can initialize to a `Sword` object like so:

```
class Character
  attr_reader :weapon_of_choice

  def initialize(weapon_of_choice)
    @weapon_of_choice = weapon_of_choice
  end
end

class Sword
  def swing
    "swing sword!"
  end
end

nick = Character.new(Sword.new)
nick.weapon_of_choice.swing
```

The `nick` object is now working in collaboration with a `Sword` object as it is
stored as a state within the `nick` object.
=end

