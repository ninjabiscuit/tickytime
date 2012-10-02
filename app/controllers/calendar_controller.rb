class CalendarController < ApplicationController

  before_filter :require_oauthed_user!

  require 'csv'

  def upload

    if request.post? && params[:file].present?

      csv_text = params[:file].read
      csv_text = csv_text.gsub("\"", "")

      csv = CSV.parse(csv_text, :headers => true)

      csv.each do |row|

        row = row.to_hash.with_indifferent_access

        code = CourseModule.find_or_initialize_by_code(row["Code"])
        code.save

        Lesson.build_from_csv(row.merge({:Code => code.id}))

      end

      redirect_to lessons_path

    end
  end

end
