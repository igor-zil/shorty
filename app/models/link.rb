require 'valid_url'
class Link < ApplicationRecord
  validates :original, presence: true,length: {minimum: 5}, :url => true
  #validates :short, length: {minimum: 5}
end
