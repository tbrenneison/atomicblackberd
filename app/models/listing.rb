class Listing < ApplicationRecord
  validates :title, presence: true,
                      length: { minimum: 4 }
  validates :price, presence: true
                      
  self.per_page = 5
end
