class Message < ActiveRecord::Base
  belongs_to :room

  def timestamp=(time)
    write_attribute(:timestamp, DateTime.parse(time))
  end

  def html_body
    Rinku.auto_link(h body).html_safe
  end

end
