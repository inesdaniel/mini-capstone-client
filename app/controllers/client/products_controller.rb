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

  def create
    response = Unirest.post("http://localhost:3000/api/products",
      parameters: {
        input_name: params[:input_name],
        input_description: params[:input_description],
        input_price: params[:input_price],
        input_image_url: params[:input_image_url]
      }
      )
  end
  def edit
    product_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products/#{product_id}")
    @product = response.body
    render "edit.html.erb"
  end


end
