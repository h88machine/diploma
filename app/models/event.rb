class Event < ActiveRecord::Base
  attr_accessible :name, :start_time 
  
  has_many :places
  
end
