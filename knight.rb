require "./trees.rb"

BOARDSIZE = 8

class KnightPathFinder
	attr_accessor :start_position
	@moves_tree

	def initialize(x,y)
		@start_position = [x,y] if x < BOARDSIZE && y < BOARDSIZE
		@start_position ||= [0,0]
		@moves_tree = PolyTreeNode.new(@start_position)
	end
	def on_board?(pos)
		pos[0] >= 0 && pos[1] >= 0 && pos[0] < 8 && pos[1] < 8
	end
	def valid_moves(coord)
		moves = []
		move1 = [coord[0]-2,coord[1]-1]
		moves.push(move1) if on_board?(move1)
		move1 = [coord[0]-1,coord[1]-2]
		moves.push(move1) if on_board?(move1)
		move1 = [coord[0]-1,coord[1]+2]
		moves.push(move1) if on_board?(move1)
		move1 = [coord[0]-2,coord[1]+1]
		moves.push(move1) if on_board?(move1)

		move1 = [coord[0]+2,coord[1]+1]
		moves.push(move1) if on_board?(move1)
		move1 = [coord[0]+1,coord[1]+2]
		moves.push(move1) if on_board?(move1)
		move1 = [coord[0]+1,coord[1]-2]
		moves.push(move1) if on_board?(move1)
		move1 = [coord[0]+2,coord[1]-1]
		moves.push(move1) if on_board?(move1)
		moves
	end
	def build_moves_tree_until_end(end_position)
		return @moves_tree if end_position == @moves_tree.value
		all_children_moves = valid_moves(@moves_tree.value)
		all_children_moves.each do |move| 
			first_children = PolyTreeNode.new(move)
			first_children.parent = @moves_tree
			return @moves_tree if move == end_position
		end
		@moves_tree
		#build_moves_tree_until_end(end_position)
	end
=begin		
	def build_moves_tree_until_end_helper(tree, end_position)
		puts tree
		p @moves_tree
		#tree.print_tree
		return PolyTreeNode.new("endofhelper")

		tree.print_tree
		
		tree.children.each do |child| 
			all_child_moves = valid_moves(child.value)
			all_child_moves.each { |move_from_child_position | tree.add_child(PolyTreeNode.new(move_from_child_position)) }
		end
		return tree if tree.bfs(end_position) == end_position
		build_moves_tree_until_end_helper(tree, end_position)
	end
=end


	def full_path(end_position)
		node = @moves_tree.bfs(end_position)
		path = []
		path.push(node)
		current = node.parent
		p "node = #{node.value}"
		p "parent = #{current.value}"
		until current == nil
			path.push(current)
			current = current.parent
		end
		path
	end

end


n1 = PolyTreeNode.new("root1")

knight1 = KnightPathFinder.new(2,2)
end_position = [3,0]

knight1.build_moves_tree_until_end(end_position).print_tree
p "finished print_Tree"
p knight1.full_path(end_position)
p "end"
