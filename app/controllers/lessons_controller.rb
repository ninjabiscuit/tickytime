class LessonsController < InheritedResources::Base

  def index
    @lessons = Lesson.by_day
  end

end
