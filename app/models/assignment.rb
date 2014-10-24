class Assignment < ActiveRecord::Base
  after_create :trigger_resync
  after_update :trigger_resync, if: :tag_prefix_changed?

  def to_s
    title
  end

  def trigger_resync
    Student.update_all(last_sync: nil)
  end

  def student_progress
    Student.assignment_status.where(submissions: {assignment: self})
  end

  def students_whose_latest_assignment_is_this
    Student.assignment_progress(self)
  end
end
