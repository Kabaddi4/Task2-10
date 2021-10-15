class Book < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true   #対義語が absence: 空であるか？

end

#presence: 空ではないか？という意