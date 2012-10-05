class CalendarController < ApplicationController

  before_filter :require_oauthed_user!

  require 'csv'

  def upload

    if request.post? && params[:file].present?

      csv_text = params[:file].read

      # have to do some dirty gsubbing here to make the file parse
      # replace commas with double pipe
      csv_text = csv_text.gsub("\",\"", "||")

      # remove quotes
      csv_text = csv_text.gsub("\"", "")

      csv = CSV.parse(csv_text, :headers => true, :col_sep => "||")

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
