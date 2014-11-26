class TestMailer < ActionMailer::Base

  # send email using ActionMailer
  #
  # to          String     'to' email address
  # subject     String     subject of email
  # body        String     content of email
  #
  def email(to, subject, body)
    mail(:to => to, :from => 'info@sampleApp.com', :subject => subject) do |format|
      format.ics {
       ical = Icalendar::Calendar.new
       e = Icalendar::Event.new
       e.dtstart = DateTime.now.utc
      # e.dtstart.icalendar_tzid="UTC" # set timezone as ""
       e.dtend = (DateTime.now + 1.day).utc
       #e.dtend.icalendar_tzid="UTC"
       e.organizer = "test@test.com"
       e.summary = "Test Meeting"
       e.description = <<-EOF
         Venue: Some Conference room
         Date: 18 November 2014
         Time: 10 am
       EOF
       ical.add_event(e)
       ical.publish
       ical.to_ical
       render :text => ical.to_ical
      }
    end
  end
end