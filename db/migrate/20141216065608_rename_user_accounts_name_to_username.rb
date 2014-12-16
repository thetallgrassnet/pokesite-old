class RenameUserAccountsNameToUsername < ActiveRecord::Migration
  def up
    remove_index  :user_accounts, :name
    rename_column :user_accounts, :name, :username
    add_index     :user_accounts, :username, unique: true
  end

  def down
    remove_index  :user_accounts, :username
    rename_column :user_accounts, :username, :name
    add_index     :user_accounts, :name, unique: true
  end
end
