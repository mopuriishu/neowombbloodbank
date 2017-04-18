require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "blood_required" do
    mail = Notification.blood_required
    assert_equal "Blood required", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
