class Topic < ApplicationRecord
  has_many :posts
  has_many :sponsored_posts, dependent: :destroy
end
