class Lesson < ActiveRecord::Base
  attr_accessible :course_module_id, :end_at, :groups, :room, :start_at, :title, :lesson_type

  has_one :course_module

  def self.build_from_csv(row)

    puts row.inspect

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

  def self.all_from_now
    where(["start_at >= ?", Time.now])
  end

  def self.current_week
    where("start_at >= ? AND start_at <= ?", Time.now, (Time.now + 1.week))
  end

  def self.current_month
    where("start_at >= ? AND start_at <= ?", Time.now, (Time.now + 1.month))
  end

  def duration
    Time.at(end_at - start_at).utc.strftime("%k:%M")
  end

end
