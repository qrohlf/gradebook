class AddTagPrefixToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :tag_prefix, :string
  end
end
