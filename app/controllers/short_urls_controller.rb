require 'url_shortener'
require 'url_parser'

class ShortUrlsController < ApplicationController
  def new
    @url = ShortUrl.new
  end

  def create
    @url = ShortUrl.new(short_url_params)

    url = UrlParser.parse(params[:short_url][:url])

    short_code = UrlShortener.shorten(url) do |arg|
      ShortUrl.where(url: arg)
    end

    @url = ShortUrl.new(url: url.to_s, short_code: short_code)

    existing = ShortUrl.find_by(short_code: short_code)

    if existing.blank?
      @url.save
    else
      @url = existing
    end

    if @url.valid?
      redirect_to short_url_url @url.id
    else
      render :new
    end
  rescue
    render :new
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
  def short_url_params
    params.require(:short_url).permit(:url)
  end
end
