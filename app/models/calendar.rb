class Calendar < ActiveRecord::Base

  attr_accessible :google_id, :kind, :etag, :summary
  belongs_to :user

  def to_param
    self.google_id
  end

end
