require 'pry'

class BufferEmptyException < Exception 
end

class CircularBuffer
    attr_accessor :memory, :state
   
    STATUS = ['EMPTY', 'FULL']
    
  def initialize(buffer_size)
    @memory = Array.new(buffer_size) { Memory.new }
    @state = STATUS.fetch(0)
    @starting_point = memory.index(memory.sample)
  end

  def write
    
  end
  
  def forced_write
      
  end

  def read
    if self.is_empty?
        raise BufferEmptyException
    end
  end
  
  def is_oldest?
      oldest == 'true'
  end

  def is_empty?
      #binding.pry
    state == STATUS.fetch(0) || (memory.select { |index| index.data }.empty)
  end


end

class Memory
    attr_accessor :data, :position, :next_data, :oldest
   
   def initialize()
       @data = nil
       @position = 0
       @next_data = 0
       @oldest = 'false'
   end 
    
end