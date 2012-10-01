class CourseModule < ActiveRecord::Base
  attr_accessible :code, :title

  validates :code, :uniqueness => true

  has_many :lessons

end
