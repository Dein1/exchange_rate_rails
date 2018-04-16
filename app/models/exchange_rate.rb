class ExchangeRate < ApplicationRecord
  validates :rate, presence: true, numericality: { greater_than: 0 }
  validate :date, :not_in_the_past?, on: :update

  private

  def not_in_the_past?
    errors.add(:date, 'The date must be in the future.') if date < Time.now
  end
end
