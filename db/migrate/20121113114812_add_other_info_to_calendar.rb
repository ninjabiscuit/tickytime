class AddOtherInfoToCalendar < ActiveRecord::Migration
  def change

    add_column :calendars, :kind, :string
    add_column :calendars, :etag, :string
    add_column :calendars, :summary, :string

  end
end
