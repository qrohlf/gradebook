class AddFeedbackToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :feedback, :string
  end
end
