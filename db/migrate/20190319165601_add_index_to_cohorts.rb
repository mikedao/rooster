class AddIndexToCohorts < ActiveRecord::Migration[5.2]
  def change
    add_index :cohorts, :cohort_id
  end
end
