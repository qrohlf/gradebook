class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :sender
      t.string :body
      t.belongs_to :room, index: true
      t.datetime :timestamp

      t.timestamps
    end
  end
end
