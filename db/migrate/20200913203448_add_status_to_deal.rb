class AddStatusToDeal < ActiveRecord::Migration[6.0]
  def change
    add_column :deals, :status, :integer, default: 0
  end
end
