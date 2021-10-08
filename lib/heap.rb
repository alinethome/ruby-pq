class Heap
  def initialize(elements = [], &order)
    @order = order || Proc.new { |a, b| a <=> b } 
  end
end
