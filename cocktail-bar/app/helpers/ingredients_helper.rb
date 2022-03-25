# frozen_string_literal: true

module IngredientsHelper
  def image_valid?(url)
    uri = URI(url)
    response = Net::HTTP.get_response(uri)
    response.code == '200'
  end
end
