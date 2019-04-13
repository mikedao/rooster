class AddStatusToCohorts < ActiveRecord::Migration[5.2]
  def change
    add_column :cohorts, :status, :string
  end
end
