class Link < ApplicationRecord
  validates :original, presence: true,
  	           length: {minimum: 5}
end
