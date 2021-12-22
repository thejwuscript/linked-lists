class LinkedList
  attr_accessor :name, :head, :tail

  def initialize(name)
    @head = nil
    @tail = nil
    @name = name
  end

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

  def size
    count = 0
    temp = head
    until temp.nil?
      count += 1
      temp = temp.next_node
    end
    count
  end

  def to_s
    array = []
    temp = head
    until temp.nil?
      array << temp.value
      temp = temp.next_node
    end
    array.push("nil").join(' -> ')
  end

  def at(index)
    temp = head
    index.times do
      temp = temp.next_node
    end
    temp
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