class Submission < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :student

  enum status: [ :not_graded, :incomplete, :completed ]

  validates :student, presence: true

  def github_url

      student.github_repo_url+"/releases/tag/"+tag
  end

  def to_s
    tag
  end

  def status_class
    {
      not_graded: 'default',
      incomplete: 'info',
      completed: 'success'
    }[status.to_sym]
  end

  def status_label
    "<span class='label label-#{status_class}'>#{status.humanize}</span>".html_safe
  end

  def self.color_for_status(status)
    {
      not_graded: '#999999',
      incomplete: '#17a3a5',
      completed: '#8dbf67'
    }.with_indifferent_access[status]
  end
end
