class Place < ActiveRecord::Base
  attr_accessible :number, :price, :event_id
  
  validates :number, presence: true
  #validates :price,  presence: true
  
  has_one :order
  belongs_to :event
  
end
