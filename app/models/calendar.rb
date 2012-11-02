class Calendar < ActiveRecord::Base

  attr_accessible :calendar_id
  belongs_to :user

end
