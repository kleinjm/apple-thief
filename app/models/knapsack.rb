class Knapsack
  # return an array of an array of included item's names, the total weight used, and the total value of all items
  def self.dynamic_programming_knapsack(items, max_weight)
    num_items = items.size                                          # an array of input items
    cost_matrix = Array.new(num_items){Array.new(max_weight+1, 0)}  # multi-demensional array of number of times x the max weight. All cells set to 0
   
    num_items.times do |i|                          # for each time
      (max_weight + 1).times do |j|                 # for each weight
        if(items[i].weight > j)                     # if the knapsack can't fit this item yet
          cost_matrix[i][j] = cost_matrix[i-1][j]   # set its value to the value cell of the item before it (on the same weight column)
        else
          cost_matrix[i][j] = [cost_matrix[i-1][j], items[i].value + cost_matrix[i-1][j-items[i].weight]].max   # if it can fit, take the maximum of either the last item's value cell or this item's value plus the value of the item's cell in the cell of the remaining weight to be filled
        end
      end
    end
    used_items = get_used_items(items, cost_matrix)
    [get_list_of_used_items(items, used_items).compact,                   # used items with nil items removed
     items.zip(used_items).map{|item,used| item.weight*used}.inject(:+),  # total weight
     cost_matrix.last.last]                                               # total value
  end
  
  # return an array of equal structure to the items array indicating the items to be used
  # ie. [<Item1>, <Item2>, <Item3>] -> [1, 0, 1]
  def self.get_used_items(items, cost_matrix)
    i = cost_matrix.size - 1                # set indexer i to the number of items - 1
    currentCost = cost_matrix[0].size - 1   # set indexer to the max capacity
    marked = cost_matrix.map{0}             # make an array of length of size items count and set all values to 0 

    while(i >= 0 && currentCost >= 0)       # while there are still items and capacity
      if (items[i].weight <= currentCost) && ((i == 0 && cost_matrix[i][currentCost] > 0) || (cost_matrix[i][currentCost] != cost_matrix[i-1][currentCost])) # if we can add an item
        marked[i] = 1                       # place a marker at the index of this item
        currentCost -= items[i].weight      # decrease the remaining free weight by the this item's weight
      end
      i -= 1                                # decrement i
    end
    marked
  end
  
  # match the used items array against the itmes array to return the names of the items used
  def self.get_list_of_used_items(items, used_items)
    items.zip(used_items).map{|item,used| item if used>0}
  end
end