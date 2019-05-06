class Attendance < ApplicationRecord
  after_create :confirmation_send

  belongs_to :user
  belongs_to :event

  validates :stripe_customer_id, uniqueness: true

  def confirmation_send
    UserMailer.attendee_email(self).deliver_now
  end
end
