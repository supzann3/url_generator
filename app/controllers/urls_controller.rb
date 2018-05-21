class UrlsController < ApplicationController

  def generator
    original_url = params[:original]
    @url = Url.create(original: original_url)
    if @url.valid?
      @original = self.request.base_url + "/" + @url.url_safe
    else
      render action: "index"
    end
  end

  def show
    @url = Url.find_by_url_safe(params[:url_safe])
    if @url.blank?
      @error = "The page you are trying to access does not exist"
    else
      redirect_to @url.original
    end
  end
end
