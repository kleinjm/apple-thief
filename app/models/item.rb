class Item < ActiveRecord::Base
  attr_accessible :description, :name, :photo_url, :value, :weight

  validates_presence_of :name
  validates_numericality_of :weight
end
