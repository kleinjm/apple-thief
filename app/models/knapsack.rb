class Knapsack
  KnapsackItem = Struct.new(:name, :weight, :value)  # ad hoc item struct. TODO: Make an active model for this
  
  # return an array of an array of included item's names, the total weight used, and the total value of all items
  def dynamic_programming_knapsack(items, max_weight)
    num_items = items.size                                          # an array of input items
    cost_matrix = Array.new(num_items){Array.new(max_weight+1, 0)}  # multi-demensional array of number of tiems x the max weight. All cells set to 0
   
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
    [get_list_of_used_items_names(items, used_items),                     # used items names
     items.zip(used_items).map{|item,used| item.weight*used}.inject(:+),  # total weight
     cost_matrix.last.last]                                               # total value
  end
  
  # return an array of equal structure to the items array indicating the items to be used
  # ie. [<Item1>, <Item2>, <Item3>] -> [1, 0, 1]
  def get_used_items(items, cost_matrix)
    i = cost_matrix.size - 1                # set indexer i to the maximum weight
    currentCost = cost_matrix[0].size - 1   # set indexer to last item index
    marked = cost_matrix.map{0}             # make an array of length of number of weights and set all values to 0 
   
    while(i >= 0 && currentCost >= 0)       # while the counters for weights and items are >= 0
      if(i == 0 && cost_matrix[i][currentCost] > 0 ) || (cost_matrix[i][currentCost] != cost_matrix[i-1][currentCost]) # if there is remaining value for this item at weight 0 OR the the item before this item doesn't have the same value
        marked[i] = 1                       # place a marker at the index of this item
        currentCost -= items[i].weight      # decrease the remaining free weight by the this item's weight
      end
      i -= 1                                # decrement i
    end
    marked
  end
  
  # match the used items array against the itmes array to return the names of the items used
  def get_list_of_used_items_names(items, used_items)
    items.zip(used_items).map{|item,used| item.name if used>0}.compact.join(', ')
  end
   
  if $0 == __FILE__
    items = [
      KnapsackItem['map'                   ,   9, 150], KnapsackItem['compass'            , 13,  35],
      KnapsackItem['water'                 , 153, 200], KnapsackItem['sandwich'           , 50, 160],
      KnapsackItem['glucose'               ,  15,  60], KnapsackItem['tin'                , 68,  45],
      KnapsackItem['banana'                ,  27,  60], KnapsackItem['apple'              , 39,  40],
      KnapsackItem['cheese'                ,  23,  30], KnapsackItem['beer'               , 52,  10],
      KnapsackItem['suntan cream'          ,  11,  70], KnapsackItem['camera'             , 32,  30],
      KnapsackItem['t-shirt'               ,  24,  15], KnapsackItem['trousers'           , 48,  10],
      KnapsackItem['umbrella'              ,  73,  40], KnapsackItem['waterproof trousers', 42,  70],
      KnapsackItem['waterproof overclothes',  43,  75], KnapsackItem['note-case'          , 22,  80],
      KnapsackItem['sunglasses'            ,   7,  20], KnapsackItem['towel'              , 18,  12],
      KnapsackItem['socks'                 ,   4,  50], KnapsackItem['book'               , 30,  10]
    ]
   
    names, weight, value = dynamic_programming_knapsack(items, 400)
    puts
    puts 'Dynamic Programming:'
    puts
    puts "Found solution: #{names}"
    puts "total weight: #{weight}"
    puts "total value: #{value}"
  end
end