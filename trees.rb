#trees

class PolyTreeNode
	attr_accessor :value, :parent
	attr_reader :children
	def inspect_children
		array_of_children = @children.map { |child| child.value }
	end
	def inspect
		@value
	end
	def initialize(value)
		@value = value
		@parent = nil
		@children = []
	end
	def parent=(arg)
		#change arg's children
		arg.add_child(self)
		#change self's existing parent. (remove self from parent's children)
		self.parent.remove_child(self) unless self.parent == nil
		#finally set parent to arg
		@parent = arg
	end
	def add_child(child)
		@children << child
	end
	def remove_child(child)
		@children.keep_if{ |c| c != child }
	end
	def rdfs(target)
		all_children = []
		all_children.push(self)
		until all_children.empty?
			current = all_children.pop
			p current.value
			return current if current.value == target
			all_children.concat(current.children)
		end
	end
	def dfs(target)
		p self
		if @value == nil
			return
		elsif @value == target
			return true
		elsif @children.empty?
			return
		else 
			@children[0].dfs(target) 
			@children[1].dfs(target) unless @children[1]  == nil
		end
	end

	def bfs(target)
		all_children = []
		all_children.push(self)
		until all_children.empty?
			current = all_children.shift
			return current if current.value == target
			all_children.concat(current.children)
		end
	end
	def print_tree 
		all_children = []
		all_children.push(self)
		until all_children.empty?
			current = all_children.shift
			p current.value 
			all_children.concat(current.children)
		end
	end
end


def build_tree(values)
	values.each do |val| 
		p val
	end
end

=begin
#build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

n1 = PolyTreeNode.new("root1")
n2 = PolyTreeNode.new("root2")
n3 = PolyTreeNode.new("root3")
n4 = PolyTreeNode.new("root4")
n5 = PolyTreeNode.new("root5")
n6 = PolyTreeNode.new("root6")
n7 = PolyTreeNode.new("root7")

n2.parent = n1
n3.parent = n1
n4.parent = n2
n5.parent = n2
n6.parent = n3
n7.parent = n5


#p n1.dfs("root5")
#p n1.inspect_children
n1.print_tree
p "fin"
=end

