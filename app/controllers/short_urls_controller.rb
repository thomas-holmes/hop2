class ShortUrlsController < ApplicationController
  def new
    @url = ShortUrl.new
  end

  def create
    @url = ShortUrl.new(short_url_params(params))
    @url.short_code = SecureRandom::urlsafe_base64(6)
    if @url.save
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
