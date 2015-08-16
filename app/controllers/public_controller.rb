class PublicController < ApplicationController
  def bag_selection
  end

  def item_selection
    session[:bag] = params[:bag]
  end

  def check_out
    @bag = Bag.find(session[:bag])

    @value, @items, @weight = Item.knapsack_unbound_problem(@bag.capacity)
  end

  def basic_knapsack
    @bag = Bag.find(session[:bag])

    @items, @weight, @value = Item.knapsack_problem(@bag.capacity)
    render "public/check_out"
  end
end