class AddIndexToUserIdOnCalendars < ActiveRecord::Migration
  def change
    add_index :calendars, :user_id, :name => 'user_id_ix'
  end
end
