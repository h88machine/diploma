class Order < ActiveRecord::Base
  
  #accepts_nested_attributes_for :status
  attr_accessible :place_number, :price, :place_id, :user_id
  
  belongs_to :user
  belongs_to :place
  
  after_save :set_place_status
  
  #validates :user_id, presence: true
  
  private
  
  def set_place_status
    place.update_attribute(:status, 1)
  end

  
end
