class Item < ActiveRecord::Base
  # include Knapsack

  attr_accessible :description, :name, :photo_url, :value, :weight, :quantity, :priority

  validates_presence_of :name
  validates_numericality_of :weight
  validates_uniqueness_of :priority, :name

  default_scope order(:name)

  # set the quantity and priority to nil
  def clear_quantity_and_priority
    self.update_attributes(quantity: nil, priority: nil)
  end

  # set all quantities and priorities to nil
  def self.clear_all_quantities_and_priorities
    Item.all.map{ |u| u.clear_quantity_and_priority }
  end

  def self.knapsack_problem(items, capacity)
    Knapsack.dynamic_programming_knapsack(items, capacity)
  end
end
