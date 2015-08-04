class Bag < ActiveRecord::Base
  attr_accessible :capacity, :description, :name, :photo_url

  validates_presence_of :name
  validates_numericality_of :capacity

  before_save :format_name

  def format_name
    f = self.name.strip
    self.name = f.slice(0,1).capitalize + f.slice(1..-1)
  end
end
