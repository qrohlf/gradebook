class Student < ActiveRecord::Base
  extend FriendlyId
  has_many :submissions
  friendly_id :random, use: [:slugged, :finders]

  def random
    s = ''
    loop do
      s = SecureRandom.hex(4)
      return s unless Student.exists?(s)
    end
  end

  def full_name
    first_name + " " + last_name
  end

  def github_url
    "https://github.com/"+github_username
  end

  def github_repo_url
    github_url+"/"+github_repo
  end

  def to_param
    slug
  end

  def to_s
    full_name
  end
end
