# frozen_string_literal: true

class StoresController < ProtectedController
  before_action :set_store, only: %i[show update destroy]

  # GET /stores
  def index
    @stores = Store.all

    render json: @stores
  end

  def indexuser
    @stores = current_user.stores.all

    render json: @stores
  end

  # GET /stores/1
  def show
    render json: @store
  end

  # POST /stores
  def create
    @store = current_user.stores.build(store_params)

    if @store.save
      render json: @store, status: :created, location: @store
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stores/1
  def update
    if @store.update(store_params)
      render json: @store
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stores/1
  def destroy
    @store.destroy
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_store
    @store = current_user.stores.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def store_params
    params.require(:store).permit(:name, :location)
  end

  private :set_store, :store_params
end
