class StoreController < ApplicationController
  def index
    increment_counter
    @products = Product.order(:title)
  end

  private

  def increment_counter
    session[:counter] ||= 0
    session[:counter] += 1
    @counter = session[:counter]
  end
end
