class Node

  attr_accessor :value, :edges

  def initialize(value)
    @value = value
    @edges = []
  end

  def add_edge(other_node)
    @edges << other_node
  end

  def nodes
    @edges.each do |edge|
      p edge.value
    end
  end



end
