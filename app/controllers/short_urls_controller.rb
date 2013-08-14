class ShortUrlsController < ApplicationController
  def new
    @url = ShortUrl.new
  end
end
