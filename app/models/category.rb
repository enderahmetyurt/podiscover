class Category < ApplicationRecord
  has_many :genres, dependent: :destroy
  has_many :podcasts, through: :genres

  def sample_podcasts
    result = []

    Array.new(4).each_with_index do |element, index|
      result << podcasts[index]
    end

    result
  end
end
