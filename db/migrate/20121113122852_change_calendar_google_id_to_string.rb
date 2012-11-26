class ChangeCalendarGoogleIdToString < ActiveRecord::Migration
  def change
    change_column :calendars, :google_id, :string
  end
end
