class CreateCourseModules < ActiveRecord::Migration
  def change
    create_table :course_modules do |t|
      t.string :title
      t.string :code
      t.timestamps
    end
  end
end
