class Room < ActiveRecord::Base
  extend FriendlyId
  has_many :messages
  friendly_id :name, use: [:slugged, :finders]

  def to_param
    slug
  end
end
