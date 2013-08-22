class ShortUrl < ActiveRecord::Base
  validates :short_code, presence: true, uniqueness: true
  validates :url, presence: true
end
