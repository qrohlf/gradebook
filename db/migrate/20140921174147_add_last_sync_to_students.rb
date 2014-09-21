class AddLastSyncToStudents < ActiveRecord::Migration
  def change
    add_column :students, :last_sync, :datetime
  end
end
