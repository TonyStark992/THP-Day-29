class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :stripe_customer_id, presence: true
  
  after_create :attendance_send

  def attendance_send
    UserMailer.attendance_email(self).deliver_now
  end
end
