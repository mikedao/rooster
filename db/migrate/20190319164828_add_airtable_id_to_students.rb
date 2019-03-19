class AddAirtableIdToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :airtable_id, :string
  end
end
