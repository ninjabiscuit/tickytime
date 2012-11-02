class LessonsController < InheritedResources::Base

  def index

    if current_user.present?
      if params["timeframe"] == "all"
        @lessons = current_user.lessons.by_day
      elsif params["timeframe"] == "month"
        @lessons = current_user.lessons.current_month.by_day
      else
        @lessons = current_user.lessons.current_week.by_day
      end
    end
  end

end
