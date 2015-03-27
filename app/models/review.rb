class Review < ActiveRecord::Base
  belongs_to :restaurant

  validates :body,
    presence: true,
    length: { minimum: 5}

  validates :rating,
    presence: true,
    numericality: { greater_than: 0, less_than: 6,
    message: "rating must be 1-5"}
end
