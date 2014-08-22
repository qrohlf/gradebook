class Message < ActiveRecord::Base
  belongs_to :room

  def timestamp=(time)
    write_attribute(:timestamp, DateTime.parse(time))
  end
end
