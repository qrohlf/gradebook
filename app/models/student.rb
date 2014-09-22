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

  def sync_tags(force_update: false, tags: nil)
    return unless github_username and github_repo #can't update a user's tags if their info isn't here
    return unless force_update or last_sync.nil? or last_sync < DateTime.now - 5.minutes
    tags ||= Octokit.tags(github_username+'/'+github_repo).map(&:name)
    Assignment.find_each do |assignment|
      assignment_tags = tags.select{|t| t.start_with? assignment.tag_prefix} unless assignment.tag_prefix.nil?
      puts assignment.to_s+" -> "+assignment_tags.join(", ")
      assignment_tags.each do |tag|
        submissions.find_or_create_by(tag: tag, assignment: assignment)
      end
    end
    update_attribute :last_sync, DateTime.now
  end

  def self.sync_all_tags!
    students = where.not(github_username: nil, github_repo: nil)
    data = Parallel.map(students, in_threads: 8) do |student|
      {student: student, tags: Octokit.tags(student.github_username+'/'+student.github_repo).map(&:name)}
    end
    data.each do |datum|
      datum[:student].sync_tags(tags: datum[:tags])
    end
  end
end
