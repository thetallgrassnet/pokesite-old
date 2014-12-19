class AddIsAdminToUserAccounts < ActiveRecord::Migration
  def change
    add_column :user_accounts, :is_admin, :boolean, default: false
  end
end
