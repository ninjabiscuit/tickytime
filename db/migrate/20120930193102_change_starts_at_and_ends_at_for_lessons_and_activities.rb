class ChangeStartsAtAndEndsAtForLessonsAndActivities < ActiveRecord::Migration
  def change
    change_column :lessons, :start_at, :datetime
    change_column :lessons, :end_at, :datetime

    change_column :activities, :start_at, :datetime
    change_column :activities, :end_at, :datetime
  end
end
