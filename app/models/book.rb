class Book < ActiveRecord::Base

  validates :title, presence: true, length: {maximum: 50}
  validates :format, presence: true, inclusion: { in: %w(Hardcover Paperback Audio eBook)}
  validates :length, presence: true, numericality: {
    minimum: 0,
    # maximum: 5000
    }
  validates :release_year, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1800,
    less_than_or_equal_to: 2100
    }
  validates :rating, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
    }
end
