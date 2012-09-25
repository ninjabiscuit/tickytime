class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string  :start_at
      t.string  :end_at
      t.string  :title
      t.text    :notes
      t.boolean :is_completed
      t.timestamps
    end
  end
end
