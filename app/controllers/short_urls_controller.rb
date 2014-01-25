require 'url_parser'

class ShortUrlsController < ApplicationController
  def new
    @url = ShortUrl.new
  end

  def create
    @url = ShortUrl.new(short_url_params)

    url = UrlParser.parse(params[:short_url][:url])

    @url = ShortUrl.new(url: url.to_s,
                        short_code: SecureRandom::urlsafe_base64(4),
                        secret_code: SecureRandom::urlsafe_base64(8),
                       )

    @url.user = current_user

    if @url.save
      redirect_to short_url_url @url.secret_code
    else
      render :new
    end
  rescue
    render :new
  end

  def show
    @url = ShortUrl.find_by!(secret_code: params[:secret_code])
  end

  def redirect
    code = params[:short_code]
    @url = ShortUrl.find_by!(short_code: code)

    if @url.disabled
      render 'errors/not_found', status: 404
    else
      redirect_to @url.url
    end
  end

  def disable
    @url = ShortUrl.find_by!(secret_code: params[:secret_code])
    @url.disabled = true
    @url.save

    render :show
  end

  private
  def short_url_params
    params.require(:short_url).permit(:url)
  end
end
