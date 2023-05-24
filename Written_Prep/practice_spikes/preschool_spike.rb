# ### Preschool (by Natalie Thompson)

# Inside a preschool there are children, teachers, class assistants, a
# principle, janitors, and cafeteria workers. Both teachers and assistants can
# help a student with schoolwork and watch them on the playground. A teacher
# teaches and an assistant helps kids with any bathroom emergencies. Kids
# themselves can learn and play. A teacher and principle can supervise a class.
# Only the principle has the ability to expel a kid. Janitors have the ability
# to clean. Cafeteria workers have the ability to serve food. Children,
# teachers, class assistants, principles, janitors and cafeteria workers all
# have the ability to eat lunch.

=begin
Extract Nouns and Verbs

Nouns:
- Child
- Teacher
- Class Assistant
- Principle
- Janitor
- Cafeteria Worker

Verbs
- teaches
- help with schoolwork
- watch on playground
- helps with bathroom emergencies
- learn
- play
- supervise
- expel
- clean
- serve food
- eat lunch

Organize Verbs with Nouns

Principle
- supervise
- eat lunch

Teacher
- teach
- supervise
- eat lunch
- help with schoolwork
- watch on playground

TA
- help with schoolwork
- bathroom emergencies
- watch on playground
- eat lunch

Child
- learn
- play
- eat lunch

Janitor
- Clean
- eat lunch

Cafeteria Worker
- serve food
- eat lunch
=end

module Supervisable
  def supervise; end
end

module Watchable
  def watch_kids_on_playground; end
end

module Helpable
  def help_with_schoolwork; end
end

class Person
  def eat_lunch; end
end

class Principle < Person
  include Supervisable

  def expel; end
end

class Teacher < Person
  include Supervisable
  include Helpable
  include Watchable

  def teach; end
end

class TeacherAssistant < Person
  include Watchable
  include Helpable

  def bathroom_emerg; end
end

class Child < Person
  def play; end

  def learn; end
end

class Janitor < Person
  def clean; end
end

class CafteriaWorker < Person
  def serve_food; end
end