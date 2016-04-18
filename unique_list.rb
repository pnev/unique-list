class Node

  attr_accessor :value, :next_node

  def initialize(value, next_node)
    @value=value
    @next_node=next_node
  end

end

class UniqueList

  def add(value)

    if empty?
      @head = @tail = Node.new(value, nil)
    else
      current_node = @head
        if(current_node.value == value)
          return nil
        else
          new_node = Node.new(value, nil)
          @tail.next_node = new_node
          @tail = new_node
        end
    end
  end

   def empty?
      #defines an empty list
      @head == nil
    end

   def remove (value)
      #removes a value at the head, tail or middle of the list
     current_node = @head
     if (value == current_node.value)
       @head = @head.next_node
     else
       while (current_node != nil) && (current_node.next_node != nil) && ((current_node.next_node).value != value)
                current_node = current_node.next_node
       end
       if (current_node != nil) && (current_node.next_node != nil)
                current_node.next_node = (current_node.next_node).next_node
       end
     end
    end

    def find (value)
      #finds node with the expected value
      current_node = @head
      while current_node !=nil
        if(value == current_node.value)
          return current_node
          current_node = current_node.next_node
        end
      end
    end

    def values
    #displays the values in the list as an array
    current_node = @head
    list_display = []
    if empty?
      return list_display
    else
      while current_node !=nil
        list_display.push(current_node.value.to_s)
        current_node = current_node.next_node
      end
    end
      return list_display.join("->").split("->").map { |i| i.to_i}
    end

  end
