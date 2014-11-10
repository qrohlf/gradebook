class AddGradeToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :grade, :string
  end
end
