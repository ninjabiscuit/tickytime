class CalendarController < ApplicationController

  before_filter :require_oauthed_user!

  require 'csv'

  def upload
    if request.post? && params[:file].present?
      
      csv_text = params[:file].read
      csv_text = csv_text.gsub("\"", "")

      puts csv_text

      csv = CSV.parse(csv_text, :headers => true)
      csv.each_with_index do |row, i|
      
        # SKIP: header i.e. first row OR blank row
        next if i == 0

        row = row.to_hash.with_indifferent_access
        puts row.to_hash.symbolize_keys

      end  
    end
  end

end
