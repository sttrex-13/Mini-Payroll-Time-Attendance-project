module TimeAttendancesHelper
  def format_date(date)
    date.strftime("%b %d, %Y") if date
  end

  def format_time(time)
    time.strftime("%H:%M") if time
  end
end
