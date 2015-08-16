class Item < ActiveRecord::Base
  # include Knapsack

  attr_accessible :description, :name, :photo_url, :value, :weight, :quantity, :priority

  validates_presence_of :name
  validates_numericality_of :weight
  validates_uniqueness_of :priority, allow_blank: true
  validates_uniqueness_of :name

  default_scope order(:name)

  # the value * the priority
  def benifit
    priority.blank? ? value : value * (12-priority)
  end

  # set the quantity and priority to nil
  def clear_quantity_and_priority
    self.update_attributes(quantity: nil, priority: nil)
  end

  # set all quantities and priorities to nil
  def self.clear_all_quantities_and_priorities
    Item.all.map{ |u| u.clear_quantity_and_priority }
  end

  def self.knapsack_problem(capacity)
    Knapsack.dynamic_programming_knapsack(Item.all, capacity)
  end

  def self.knapsack_unbound_problem(capacity)
    KnapsackUnbound.unbounded_knapsack(Item.all, capacity)
  end
end
