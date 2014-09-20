class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :tag
      t.belongs_to :assignment, index: true
      t.belongs_to :student, index: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
