# frozen_string_literal: true

class ListItemsController < ApplicationController
  before_action :set_list_item, only: %i[show update destroy]

  # Removed: No use case
  # # GET /list_items
  # def index
  #   @list_items = ListItem.all
  #
  #   render json: @list_items
  # end

  # GET /list_items/1
  def show
    if current_user.lists.list_items.find(params[:id])
      render json: @list_item
    else
      head :no_content
    end
  end

  # POST /list_items
  def create
    @list_item = ListItem.new(list_item_params)

    if @list_item.save
      render json: @list_item, status: :created, location: @list_item
    else
      render json: @list_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /list_items/1
  def update
    if @list_item.update(list_item_params)
      render json: @list_item
    else
      render json: @list_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /list_items/1
  def destroy
    @list_item.destroy
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_list_item
    @list_item = ListItem.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def list_item_params
    params.require(:list_item).require(:quantity, :list_id, :item_id)
    params.require(:list_item).permit(:purchased, :quantity, :list_id, :item_id)
  end
  private :set_list_item, :list_item_params
end
