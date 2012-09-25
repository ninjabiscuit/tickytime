class Activity < ActiveRecord::Base
  attr_accessible :title, :start_at, :end_at, :notes, :is_completed

  validates_presence_of :title, :start_at, :end_at
end
