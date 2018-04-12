class ExchangeRate < ApplicationRecord
  validates :rate, presence: true
  validate :date, :not_in_the_past?, on: :update

  private

  def not_in_the_past?
    errors.add(:date, 'The entered date is in the past.') if date < Time.now
  end
end
