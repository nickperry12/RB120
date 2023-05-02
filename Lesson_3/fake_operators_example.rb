# example of defining our own "fake operator" methods

class Person
	attr_accessor :name, :age

	def initialize(name, age)
		@name = name
		@age = age
	end
end

class Team
	attr_accessor :name, :members

	def initialize(name)
		@name = name
		@members = []
	end

	def <<(person)
		members.push person
	end

	def +(other_team)
		temp_team = Team.new("Temporary Team")
		temp_team.members = members + other_team.members
		temp_team
	end

  def [](idx)
		members[idx]
	end

	def []=(idx, obj)
		members[idx] = obj
	end
end

patriots = Team.new("New England Patriots")
patriots << Person.new("Tom Brady", 45)
patriots << Person.new("Randy Moss", 46)
patriots << Person.new("Wes Welker", 41)
patriots << Person.new("Tedy Bruschi", 49)

niners = Team.new("San Francisco 49ers")
niners << Person.new("Joe Montana", 49)
niners << Person.new("Jerry Rice", 42)
niners << Person.new("Deion Sanders", 47)

p patriots[1]
patriots[4] = Person.new("Julian Edelman", 36)
p patriots[4]