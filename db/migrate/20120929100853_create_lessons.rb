class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :start_at
      t.string :end_at
      t.integer :course_module_id
      t.string :title
      t.string :type
      t.string :groups
      t.string :room

      t.timestamps
    end

    add_index :lessons, :course_module_id
  end
end
