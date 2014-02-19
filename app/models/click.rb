class Click < ActiveRecord::Base
  belongs_to :short_url

  # Don't need this yet, but it might be handy later. Project all urls for a user and
  # the amount of times clicked.
  # scope :by_user, -> (user_id = nil) do
  #   q = select("short_urls.url, count(clicks.id) as number_of_clicks")
  #       .joins("left join short_urls on clicks.short_url_id = short_urls.id")
  #       .group("url")
  #   q = q.where("short_urls.user_id = ?", user_id) if user_id
  #   q
  # end
end
