class AddSlugToStudents < ActiveRecord::Migration
  def change
    add_column :students, :slug, :string
    add_index :students, :slug, unique: true
  end
end
