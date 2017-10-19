# frozen_string_literal: true

class ListsController < ProtectedController
  before_action :set_list, only: %i[show update destroy]

  # GET /lists
  def index
    @lists = List.all

    render json: @lists
  end

  # GET /lists/1
  def show
    render json: @list
  end

  # POST /lists
  def create
    @list = current_user.lists.build(list_params)

    if @list.save
      render json: @list, status: :created, location: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def listwitems
    list_int = current_user.lists.build
    list_items1 = params[:list][:list_items]
    list_items1.each do |_lin, li|
      listitem_handler list_int, li
    end
  end

  def listitem_handler(list, hash_in)
    li = list.list_items.new
    hash_in.each do |k, v|
      li[k] = v
    end
    li.save
  end

  # PATCH/PUT /lists/1
  def update
    if @list.update(list_params)
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = current_user.lists.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def list_params
    params.require(:list).permit(:active)
  end
end
