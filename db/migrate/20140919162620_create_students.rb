class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :github_username
      t.string :github_repo
      t.string :email

      t.timestamps
    end
  end
end
