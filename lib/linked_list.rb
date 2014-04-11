require 'linked_list_item'

class LinkedList
  attr_accessor :first_item
  attr_accessor :last_item

  def initialize(*args)
    self.last_item = nil
    args.each do |arg|
      self.add_item(arg)
    end
  end

  def add_item(item)
    new_item = LinkedListItem.new(item)
    if (self.first_item == nil)
      self.first_item = new_item
    else
      current = self.first_item
      while current.next_list_item != nil
        current = current.next_list_item
      end
      current.next_list_item = new_item
    end
    self.last_item = new_item
  end

  def last
    if (self.last_item == nil)
      return nil
    else
      return self.last_item.payload
    end
  end

  def get(number)
    current = self.first_item
    if (number < 0)
      raise IndexError
    end
    (0..number).each do |x|
      if (current == nil)
        raise IndexError
      elsif (x == number)
        return current.payload
      else
        current = current.next_list_item
      end
    end
  end

  def remove(number)
    current = self.first_item
    previous = nil
    if (number < 0)
      raise IndexError
    end
    (0..number).each do |x|
      if (current == nil)
        raise IndexError
      elsif (x == number)
        if (number == 0)
          self.first_item = current.next_list_item
        else
          previous.next_list_item = current.next_list_item
        end
      else
        previous = current
        current = current.next_list_item
      end
    end
  end

  def indexOf(value)
    index = 0
    current = self.first_item
    while current != nil
      if (current.payload.to_s == value)
        return index
        break
      else
        current = current.next_list_item
        index += 1
      end
    end
    return nil
  end

  def sorted?
    sorted = true
    previous = self.first_item
    if (previous == nil)
      return sorted
    end
    current = self.first_item.next_list_item
    while current != nil
      if (previous > current)
        sorted = false
        break
      end
      previous = current
      current = current.next_list_item
    end
    return sorted
  end

  def [](number)
    return self.get(number)
  end

  def []=(number, newvalue)
    current = self.first_item
    (0..number).each do |x|
      if (x == number)
        current.payload = newvalue
        break
      elsif (current == nil)
        raise IndexError
      else
        current = current.next_list_item
      end
    end
  end

  def size
    size = 0
    current = self.first_item
    while current != nil
      size += 1
      current = current.next_list_item
    end
    return size
  end

  def to_s
    ret = "| "
    current = self.first_item
    while current != nil
      ret = ret + current.payload.to_s
      current = current.next_list_item
      if (current != nil)
        ret = ret + ","
      end
      ret = ret + " "
    end
    ret = ret + "|"
    return ret
  end
end
