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

  def exists?
	  return true if yield(self)

    search_nodes = @edges

		until search_nodes.empty?
			node = search_nodes.pop
			return true if yield(node)
			search_nodes += node.nodes
		end
		false
	end

end
