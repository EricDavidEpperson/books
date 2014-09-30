class Book < ActiveRecord::Base

  validates :title, presence: true#, length: {maximum: 50}
  validates :format, presence: true#, inclusion: { in: %w(Hardcover Paperback Audio eBook)}
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
  validates :author, presence: true

  default_scope { order('created_at ASC') }

  include PgSearch
  pg_search_scope :search,
                  :against => [:title, :format, :author],
                  :using => {
                    :tsearch => {
                      :prefix => true,
                      :dictionary => "english"
                      }
                  }

  paginates_per 8

  def self.query(params)
    if params[:query].blank?
      Book.all
    else
      Book.search(params[:query])
    end
  end

end
