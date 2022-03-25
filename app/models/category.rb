class Category < ApplicationRecord
  has_many :genres, dependent: :destroy
  has_many :podcasts, through: :genres
end
