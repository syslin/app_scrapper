class Plant < ApplicationRecord

  scope :not_expired, -> { where('expiration_date >?', Date.today) }

  after_create :set_expiration_date

  def set_expiration_date
    self.expiration_date = Date.today + 7.days
    self.save!
  end
end
