class AddUniqueIndexToTimeAttendances < ActiveRecord::Migration[8.1]
  def change
    add_index :time_attendances, [:employee_id, :work_date], unique: true
  end
end
