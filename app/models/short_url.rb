class ShortUrl < ActiveRecord::Base
  validates :short_code, presence: true, uniqueness: true
  validates :secret_code, presence: true, uniqueness: true
  validates :url, presence: true
  belongs_to :user
  has_many :clicks
end
