#require 'base62-rb'
class Link < ApplicationRecord
  validates :original, presence: true, length: {minimum: 5}, format: {with: URI.regexp}
  #validates :short, length: {minimum: 5}

  def get_shorty
    if self.short.blank?
       Base62.encode(self.id)
    else
      self.short
    end
  end

  def custom?
    if self.short.nil?
      "generated"
    else
      "custom"
    end
  end
end
