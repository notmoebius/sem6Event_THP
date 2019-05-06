class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances

  validates :start_date, presence: true
  validates :duration, presence: true, numericality: true
  validates :description, presence: true, length: { in: 20..1000, message: "description need 20 car. min and 1000 car. max"} 
  validates :title, presence: true, length: { in: 5..140, message: "title need 5 car. min and 140 car. max"} 
  validates :price, presence: true, numericality: { in: 1..1000, }
  validates :location, presence: true

  private
  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end  
end
