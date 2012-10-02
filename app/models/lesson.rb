class Lesson < ActiveRecord::Base
  attr_accessible :course_module_id, :end_at, :groups, :room, :start_at, :title, :lesson_type

  has_one :course_module

  def self.build_from_csv(row)

    # find existing lesson from email or create new
    lesson = find_or_initialize_by_start_at("#{row["Date"]} #{row["Start"]}")
    lesson.attributes ={
      :course_module_id => row["Code"],
      :end_at => "#{row["Date"]} #{row["End"]}",
      :groups => row["Groups"],
      :room => row["Room"],
      :start_at => "#{row["Date"]} #{row["Start"]}",
      :title => row["Title"],
      :lesson_type => row["Type"]
    }
    #return lesson

    if lesson.valid?
      lesson.save
    else
      #errs << row
    end

  end

  def self.by_day
    all.group_by { |l| l.start_at.to_date.to_s(:db) }
  end

  def duration
    Time.at(end_at - start_at).utc.strftime("%H:%M")
  end

end
