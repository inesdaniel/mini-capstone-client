class Client::ProductsController < ApplicationController
  def index
    response = Unirest.get("http://localhost:3000/api/products")
    @products = response.body
    render "index.html.erb"
  end

  def show
    response_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products/#{response_id}")
    @product = response.body
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end



end
