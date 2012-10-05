module LessonsHelper

  def render_break(lesson, lessons)
    gap = lesson.calculate_break(lessons)
    render :partial => "gap", :locals => {:gap => gap} if gap.to_i > 0
  end

  def lesson_daytime_summary(lessons)
    "#{lessons.first.start_at.strftime("%a %d %b")} #{format_hour(lessons.first.start_at)} - #{format_hour(lessons.last.end_at)}"
  end

end
