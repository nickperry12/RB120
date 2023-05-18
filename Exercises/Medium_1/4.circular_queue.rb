# Circular Queue

# A circular queue is a collection of objects stored in a buffer that is treated
# as though it is connected end-to-end in a circle. When an object is added to
# this circular queue, it is added to the position that immediately follows the
# most recently added object, while removing an object always removes the object
# that has been in the queue the longest.

# This works as long as there are empty spots in the buffer. If the buffer
# becomes full, adding a new object to the queue requires getting rid of an
# existing object; with a circular queue, the object that has been in the queue
# the longest is discarded and replaced by the new object.

# Assuming we have a circular queue with room for 3 objects, the circular queue
# looks and acts like this:

# P1	P2	P3	Comments
# All positions are initially empty
# 1			      Add 1 to the queue
# 1	  2		    Add 2 to the queue
#     2		    Remove oldest item from the queue (1)
#     2	  3	  Add 3 to the queue
# 4	  2	  3	  Add 4 to the queue, queue is now full
# 4		    3	  Remove oldest item from the queue (2)
# 4	  5	  3   Add 5 to the queue, queue is full again
# 4	  5	  6	  Add 6 to the queue, replaces oldest element (3)
# 7	  5	  6	  Add 7 to the queue, replaces oldest element (4)
# 7		    6	  Remove oldest item from the queue (5)
# 7			      Remove oldest item from the queue (6)
#             Remove oldest item from the queue (7)
#             Remove non-existent item from the queue (nil)

# Your task is to write a CircularQueue class that implements a circular queue
# for arbitrary objects. The class should obtain the buffer size with an
# argument provided to CircularQueue::new, and should provide the following
# methods:

# enqueue to add an object to the queue dequeue to remove (and return) the
# oldest object in the queue. It should return nil if the queue is empty.

# You may assume that none of the values stored in the queue are nil (however,
# nil may be used to designate empty spots in the buffer).

# Personal Notes:
# Our class needs two methods: `enqueue` and `dequeue`. 

# `dequeue` should remove and return the oldest object in the queue, and should
# return `nil` if the queue is empty

# `enqueue` should add an object to the queue

# an integer should be passed into `new` that provides the buffer size

=begin
PEDAC: enqueue

Need the method that accepts one parameter, and adds an object to an array. 

Conditions:

If the array is at the max size, we need to remove the oldest element from the
array.

If the array is not at the max size, we just add the element to the array.

How can we determine what's the oldest element in the array?
- Could possibly use index position
- Newest items get added to the end of the array
- If `nil` is used to indicate empty items, the entire array should consist of
  `nil` values upon instantiation
- So, if all the values are `nil`, we can remove the first element, and then
  append the object
- 
=end

class CircularQueue
  attr_reader :queue

  def initialize(buffer_size)
    @queue = Array.new(buffer_size)
  end

  def enqueue(obj)
    if queue_empty?
      add_to_empty_queue!(obj)
    elsif any_empty_spaces?
      replace_first_empty_position!(obj)
    elsif !any_empty_spaces?
      replace_oldest_object!(obj)
    end
  end

  def dequeue
    return nil if queue.all? { |item| item == nil }
    if any_empty_spaces?
      remove_oldest_amongst_empty!
    else
      remove_oldest!
    end
  end

  private

  def any_empty_spaces?
    queue.any? { |item| item == nil }
  end

  def queue_empty?
    queue.all? { |item| item == nil }
  end

  def add_to_empty_queue!(obj)
    empty_space = queue.index(nil)
    queue[empty_space] = obj
  end

  def replace_first_empty_position!(obj)
    empty_space = queue.index(nil)
    queue.delete_at(empty_space)
    queue << obj
  end

  def replace_oldest_object!(obj)
    queue.shift
    queue << obj
  end

  def remove_oldest_amongst_empty!
    oldest_obj = queue.select { |item| item != nil }.first
    removed_item = queue[queue.index(oldest_obj)]
    queue[queue.index(oldest_obj)] = nil
    removed_item
  end

  def remove_oldest!
    removed_item = queue[0]
    queue[0] = nil
    removed_item
  end
end


queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)

puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

# should output `true` 15 times