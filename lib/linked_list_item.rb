class LinkedListItem
  include Comparable
  attr_accessor :payload
  attr_reader :next_list_item

  def initialize(item)
    @payload = item
    @next_list_item = nil
  end

  def last?
    return @next_list_item == nil
  end

  def next_list_item= (item)
    if (item === self)
      raise ArgumentError
    elsif (item != [])
      @next_list_item = item
    else
      return @next_list_item
    end
  end

  def === (other)
    return self.equal? other
  end

  def <=> (other)
    first = self.payload.to_s
    second = other.payload.to_s
    #For the arbitrary purpose of this linked list class, Symbols must always come after (i.e. be greater than) non-Symbols. Only actually compare them if both are Symbols or both are non-Symbols.
    if (self.payload.class == Symbol && other.payload.class != Symbol)
      return 1
    elsif (other.payload.class == Symbol && self.payload.class != Symbol)
      return -1
    else
      return first <=> second
    end
  end
end
