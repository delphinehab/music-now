class AddPaidToJamsUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :jams_users, :paid, :integer
  end
end
