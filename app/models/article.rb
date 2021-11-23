class Article < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :author, presence: true
end
