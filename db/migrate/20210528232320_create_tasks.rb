class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.integer :user_id
      t.integer :category_id
      t.string :category_name
      t.text :task_details
      t.date :due_date
      t.integer :complete
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
