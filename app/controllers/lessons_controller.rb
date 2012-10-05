class LessonsController < InheritedResources::Base

  def index
    @lessons = Lesson.current_week.by_day
    puts @lessons.inspect
  end

end
