class AddDescriptionAndIconToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :description, :text
    add_column :categories, :fa_icon, :string
  end
end
