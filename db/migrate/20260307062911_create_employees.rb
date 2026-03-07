class CreateEmployees < ActiveRecord::Migration[8.1]
  def change
    create_table :employees do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.decimal :salary
      t.string :position

      t.timestamps
    end
  end
end
