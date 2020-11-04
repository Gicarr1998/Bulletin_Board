class Article < ApplicationRecord
  has_many :votes, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
  validates :content, presence: true, length: {minimum: 5}
end
