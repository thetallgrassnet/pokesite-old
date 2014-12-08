class AddNameToUserAccounts < ActiveRecord::Migration
  def change
    add_column :user_accounts, :name, :string
    add_index  :user_accounts, :name, unique: true
  end
end
