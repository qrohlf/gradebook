class Room < ActiveRecord::Base
  has_many :messages
end
