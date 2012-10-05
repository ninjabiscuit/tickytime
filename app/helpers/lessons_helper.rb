module LessonsHelper

  def render_break(lesson, lessons)
    gap = lesson.calculate_break(lessons)
    render :partial => "gap", :locals => {:gap => gap} if gap.to_i > 0
  end

end
