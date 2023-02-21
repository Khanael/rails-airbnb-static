require "open-uri"
class FlatsController < ApplicationController
  def index
    set_flats
  end
  def show
    set_flats
    # raise
    @flat = @flats.find { |flat| flat['id'] == params[:id].to_i }
  end

  private

  def set_flats
    url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"
    result = URI.open(url).read

    @flats = JSON.parse(result)
  end
end
