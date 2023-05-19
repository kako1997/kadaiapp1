class Book < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  # コメントアウトする
  # validates :image, presence: true
end
