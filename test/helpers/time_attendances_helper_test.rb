require "test_helper"

class TimeAttendancesHelperTest < ActionView::TestCase
  include TimeAttendancesHelper

  test "format_date returns formatted date" do
    date = Date.new(2026, 3, 8)

    assert_equal "Mar 08, 2026", format_date(date)
  end

  test "format_date returns nil when date is nil" do
    assert_nil format_date(nil)
  end

  test "format_time returns formatted time" do
    time = Time.zone.local(2026, 3, 8, 9, 30, 0)

    assert_equal "09:30", format_time(time)
  end

  test "format_time returns nil when time is nil" do
    assert_nil format_time(nil)
  end
end