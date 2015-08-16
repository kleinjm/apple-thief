# assume all item weights w_i are positive integers
# maximize total value so that total weight is <= W
# for each w <= W, define m[w] (maximum value attained with total weight <= w)
# m[W] is the solution
# m[0] = 0
# m[w] = max[w_i<=w](v_i + m[w - w_i]) where v_i is the value of the ith kind of item
# running time is O(nW) where n is the number of items examined
# NP-complete because W is not polynomial in the length of the input to the problem

class KnapsackUnbound

  # items[i] is ith item's [weight, value]
  def self.unbounded_knapsack(items, capacity)
    knapsack = Array.new(capacity+1, 0)                       # knapsack[i] = max value of knapsack at weight i
    selected_items = Array.new(capacity+1)

    (1..capacity + 1).each do |w|
      max_value_for_w = knapsack[w - 1]                       # begin by setting to the max for the prior weight
      items.each_with_index do |item, i|                      # consider each item
        updated_w = w - item.weight                           # if we select this item, knapsack weight is now this
        if updated_w >= 0 && knapsack[updated_w] + item.benifit > max_value_for_w  # are we able to select this item and does this item increase the local max?
          max_value_for_w = knapsack[updated_w] + item.benifit   # if so, update the local max
          selected_items[w] = i                             # also note that we selected this item
        end
      end
      knapsack[w] = max_value_for_w                           # we looked at all the items, update overall max
    end
    used_items = trace_back(selected_items, items, capacity)
    [total_value(used_items), used_items, total_weight_used(used_items)] # max value and the count of each item
  end

  # returns how many of each item we got
  def self.trace_back(selected_indexes, items, capacity)
    selected_items = Array.new(items.count, 0)            # initalize an array of 0s to the size of the number of items
    while capacity >= 0                                   # move from W to 0
      cur_selected_index = selected_indexes[capacity] 
      break if cur_selected_index == nil                  # traced back to beginning
      selected_items[cur_selected_index] += 1             # we took this item
      capacity -= items[cur_selected_index].weight        # update knapsack weight to reflect item
    end
    items.zip(selected_items)                      # add the quantity of each item to an array with the item object itself
  end

  # return the total weight used from the used items
  def self.total_weight_used(used_items)
    used_items.sum{ |item, count| (item.weight * count) }
  end

  # return the total value of all items diregarding the priority multiplier
  def self.total_value(used_items)
    used_items.sum{ |item, count| (item.value * count) }
  end
end