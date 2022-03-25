class Genre < ApplicationRecord
  belongs_to :podcast
  belongs_to :category
end
