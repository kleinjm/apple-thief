class PublicController < ApplicationController
  def bag_selection
  end

  def item_selection
    session[:bag] = params[:bag]
  end

  def check_out
    @bag = Bag.find(session[:bag])

    @items, @weight, @value = Item.knapsack_problem(Item.all, @bag.capacity)
  end
end
