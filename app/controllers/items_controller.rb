# frozen_string_literal: true

class ItemsController < ProtectedController
  before_action :set_item, only: %i[show update destroy]

  # GET /items
  def index
    @items = Item.all

    render json: @items.order(:id)
  end

  # No use case present.
  # def indexuser
  #   @items = current_user.items.all
  #
  #   render json: @items
  # end

  # GET /items/1
  def show
    render json: @item
  end

  def search
    @result = Item.where('lower(name) like (?)', "%#{params[:id].downcase}%")

    render json: @result
  end

  # POST /items
  def create
    @item = current_user.items.build(item_params)

    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # No use case for delete at this time.
  # # DELETE /items/1
  # def destroy
  #   @item.destroy
  #   head :no_content
  # end

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = current_user.items.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def item_params
    params.require(:item).permit(:name, :unit, :unit_quantity)
  end
  private :item_params, :set_item
end
