def create_shortened_url(url)
  visit root_url
  fill_in 'short_url_url', with: url
  click_on 'Submit'
end
