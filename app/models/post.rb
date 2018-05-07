class Post < ApplicationRecord
  validates :title, presence: true,
                      length: { minimum: 5 }
                      
        acts_as_taggable

  self.per_page = 5

  def self.search(search)
    where("title LIKE ? OR text LIKE ?", "%#{search}%", "%#{search}%") 
  end
  
end
