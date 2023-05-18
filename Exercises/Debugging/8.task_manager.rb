# Task Manager

# Valentina is using a new task manager program she wrote. When interacting with
# her task manager, an error is raised that surprises her. Can you find the bug
# and fix it?

class TaskManager
  attr_reader :owner
  attr_accessor :tasks

  def initialize(owner)
    @owner = owner
    @tasks = []
  end

  def add_task(name, priority=:normal)
    task = Task.new(name, priority)
    tasks.push(task)
  end

  def complete_task(task_name)
    completed_task = nil

    tasks.each do |task|
      completed_task = task if task.name == task_name
    end

    if completed_task
      tasks.delete(completed_task)
      puts "Task '#{completed_task.name}' complete! Removed from list."
    else
      puts "Task not found."
    end
  end

  def display_all_tasks
    display(tasks)
  end

  def display_high_priority_tasks
    high_prio_tasks = tasks.select do |task|
      task.priority == :high
    end

    display(high_prio_tasks)
  end

  private

  def display(tasks)
    puts "--------"
    tasks.each do |task|
      puts task
    end
    puts "--------"
  end
end

class Task
  attr_accessor :name, :priority

  def initialize(name, priority=:normal)
    @name = name
    @priority = priority
  end

  def to_s
    "[" + sprintf("%-6s", priority) + "] #{name}"
  end
end

valentinas_tasks = TaskManager.new('Valentina')

valentinas_tasks.add_task('pay bills', :high)
valentinas_tasks.add_task('read OOP book')
valentinas_tasks.add_task('practice Ruby')
valentinas_tasks.add_task('run 5k', :low)

valentinas_tasks.complete_task('read OOP book')

valentinas_tasks.display_all_tasks
valentinas_tasks.display_high_priority_tasks
valentinas_tasks.display_all_tasks

# Solution

=begin
The error being raised is a `NoMethodError` on line 41, stating that we are
attempting to call the private method `select` on `nil`. We can see `tasks` is
a state of the `TaskManager` class. It is assigned an empty array upon object
instantiation, and when the `add_task` instance method is called on an object,
tasks are added to the array.

The issue with this code snippet is the syntax. When we use `task = ... `, Ruby
is parses the code and sees `task = `, which it interprets as a local variable
being initialized to something. To fix this, we can either accces the instance
variable directly by prefixing `task` with an `@`, or because both getter and
setter methods are available, we can prefix `task` with `self`. Prefixing with
`self` here is the most suitable option. If we have setter and getter methods
available for an instance variable, we should use `self`.

However, while this does fix the error, we're getting an unwanted side effect.
The purpose of this method is to display the tasks that have high priority, we
don't want to reassign `tasks` to a different array. So instead, we can go back
to initializing a local method variable `high_prio_tasks` and use the same code
to assign it an array that has selected the high priorty tasks from `tasks`. 
=end