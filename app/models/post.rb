class Post < ApplicationRecord
  validates :title, presence: true,
                      length: { minimum: 5 }

  self.per_page = 10

end
