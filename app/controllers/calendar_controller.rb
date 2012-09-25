class CalendarController < ApplicationController

  before_filter :require_oauthed_user!

  def import
    if request.post? && params[:file].present?
      infile = params[:file].read

      csv = CSV.parse(infile, :headers => true)
      csv.each_with_index do |row, i|

        # SKIP: header i.e. first row OR blank row
        next if i == 0 || row.join.blank?

        row = row.to_hash.with_indifferent_access
        puts row.to_hash.symbolize_keys
        #Moulding.create!(row.to_hash.symbolize_keys)

      end
    end
  end

end
