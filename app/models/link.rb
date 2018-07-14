require 'valid_url'
class Link < ApplicationRecord
  validates :original, presence: true,length: {minimum: 5}, :url => true
  validates :short, presence: true,length: {minimum: 5}, :url => true
end
