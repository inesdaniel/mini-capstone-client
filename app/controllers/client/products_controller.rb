class Client::ProductsController < ApplicationController
  def index
    user_input = params[:client_search]
    response = Unirest.get("http://localhost:3000/api/products",
      parameters: {
        api_search: user_input
      }
    )
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
    client_params = {
        input_name: params[:input_name],
        input_description: params[:input_description],
        input_price: params[:input_price],
        input_image_url: params[:input_image_url],
        input_stocked: params[:input_stocked]
      }
    response = Unirest.post("http://localhost:3000/api/products",
      parameters: client_params
      )
    flash[:success] = "You made a new product!"
    redirect_to "/client/products"
  end
  def edit
    product_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products/#{product_id}")
    @product = response.body
    render "edit.html.erb"
  end

  def update
    client_params = {
      input_name: params[:input_name],
      input_description: params[:input_description],
      input_price: params[:input_price],
      input_image_url: params[:input_image_url],
      input_stocked: params[:input_stocked]

    }
    response = Unirest.patch("http://localhost:3000/api/products/#{params[:id]}",
      parameters: client_params)
    
    flash[:success] = "You changed a product"
    redirect_to "/client/products/#{params[:id]}"
  end

  def destroy
    flash[:danger] = "You deleted a recipe"
    response = Unirest.delete("http://localhost:3000/api/products/#{params[:id]}")
    redirect_to "/client/products"
  end

end
