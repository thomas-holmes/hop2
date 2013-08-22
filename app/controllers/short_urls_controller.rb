require 'url_shortener'

class ShortUrlsController < ApplicationController
  def new
    @url = ShortUrl.new
  end

  def create
    @url = ShortUrl.new(short_url_params(params))

    short_code = UrlShortener.shorten @url.url, ShortUrl.where(url: @url.url)
    existing = ShortUrl.find_by(short_code: short_code)

    if existing.nil?
      @url.short_code = short_code
      @url.save
    else
      @url = existing
    end

    if @url.valid?
      redirect_to short_url_url @url.id
    else
      render :new
    end
  end

  def show
    @url = ShortUrl.find params[:id]
  end

  def redirect
    code = params[:short_code]
    @url = ShortUrl.find_by!(short_code: code)
    redirect_to @url.url
  end

  private
  def short_url_params(params)
    params.require(:short_url).permit(:url)
  end
end
