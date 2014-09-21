class AddLastSyncToStudents < ActiveRecord::Migration
  def change
    add_column :students, :last_sync, :datetime
    Student.reset_column_information
    reversible do |dir|
      dir.up { Student.update_all last_sync: DateTime.new(0) }
    end
  end
end
