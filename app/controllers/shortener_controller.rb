class ShortenerController < ApplicationController
  def new
    @url = ShortUrl.create
  end
end
