class AddVerificatedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :verificated, :boolean, default: false
  end
end
