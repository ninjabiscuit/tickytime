module LessonsHelper

  def render_break(lesson, lessons)
    gap = lesson.calculate_break(lessons)
    render :partial => "gap", :locals => {:gap => gap} if gap.to_i > 0
  end

  def lesson_daytime_summary(lessons)
    "#{lessons.first.start_at.strftime("%a %d %b")} #{spanerize(format_hour(lessons.first.start_at) + " - " + (format_hour(lessons.last.end_at)))}".html_safe
  end

  def lesson_start_end(lesson)
    "#{format_hour(lesson.start_at)} - #{format_hour(lesson.end_at)} #{spanerize(lesson.duration)}".html_safe
  end

end
