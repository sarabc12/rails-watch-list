class AddDescriptionToLists < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :description, :string
  end
end
