class LinkedList
  attr_accessor :name, :head, :tail

  def initialize(name)
    @head = nil
    @tail = nil
    @name = name
  end

  # append adds a new node containing value to the end of the list
  def append(value)
    node = Node.new(value)
    if head.nil?
      self.head = node
      self.tail = node
    else
      tail.next_node = node
      self.tail = node
    end
  end

  # prepend adds a new node containing value to the start of the list
  def prepend(value)
    node = Node.new(value)
    if head.nil?
      self.head = node
      self.tail = node
    else
      node.next_node = head
      self.head = node
    end
  end

  # size returns the total number of nodes in the list
  def size
    count = 0
    temp = head
    until temp.nil?
      count += 1
      temp = temp.next_node
    end
    count
  end

  # to_s represents your LinkedList objects as strings
  def to_s
    array = []
    temp = head
    until temp.nil?
      array << temp.value
      temp = temp.next_node
    end
    array.push("nil").join(' -> ')
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new("Integer List")
list.prepend(50)
list.prepend(35)
list.prepend(12)
list.prepend(88)
list.append(99)
puts "The name of this linked list is #{list.name}."
puts list.to_s
puts "Total number of nodes is #{list.size}."