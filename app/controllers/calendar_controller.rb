class CalendarController < ApplicationController

  before_filter :require_oauthed_user!

  require 'csv'

  def create(client, service)

    return calendar
  end

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

        Lesson.build_from_csv(row.merge({:Code => code.id, :User_id => current_user.id}))

      end

      redirect_to lessons_path

    end
  end

  def google_upload

    client = Google::APIClient.new
    client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
    client.authorization.access_token = current_user.token;

    service = client.discovered_api('calendar', 'v3')

    if current_user.calendar.present?
      puts current_user.calendar.inspect
    else
      response = client.execute(
        :api_method => service.calendars.insert,
        :body => JSON.dump({
            summary: "tickytime",
            timezone: "Europe/London"
        }),
        :headers => {'Content-Type' => 'application/json'}
      ).data.to_hash

      response["google_id"] = response.delete("id")

      calendar = current_user.build_calendar(response)
      calendar.save
    end

    # c

    # client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
    # client.authorization.access_token = current_user.token;

    # service = client.discovered_api('calendar', 'v3')
    # result = client.execute(:api_method => service.calendar_list.list)

    # result.data.items.each do |calendar|
    #   if calendar.summary == "tickytime"
    #     @calendar = calendar
    #   end
    # end

    # puts @calendar

    # if !@calendar.present?
    #   @calendar = client.execute(
    #     :api_method => service.calendars.insert,
    #     :body => JSON.dump({
    #         summary: "tickytime",
    #         timezone: "Europe/London"
    #     }),
    #     :headers => {'Content-Type' => 'application/json'}
    #   )
    # end

  end

  def insert_event(calendar_id = 'primary', event_hash)
    convert_event_hash_timestamps!(event_hash)
    event = execute(:api_method => service.events.insert,
                    :parameters => {'calendarId' => calendar_id},
                    :body => [JSON.dump(event_hash)],
                    :headers => {'Content-Type' => 'application/json'})
    event ? event.data : nil
  end

end
