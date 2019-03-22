class CreateStudents < ActiveRecord::Migration[5.2]
  enable_extension 'citext'

  def change
    create_table :students do |t|
      t.citext :name
      t.string :starting_cohort
      t.string :current_cohort
      t.string :program
      t.string :email

      t.timestamps
    end
  end
end
