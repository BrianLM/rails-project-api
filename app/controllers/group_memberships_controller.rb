# frozen_string_literal: true

class GroupMembershipsController < ProtectedController
  before_action :set_group_membership, only: %i[show update destroy]

  # GET /group_memberships
  def index
    @group_memberships = current_user.group_memberships.all

    render json: @group_memberships
  end

  # GET /group_memberships/1
  def show
    render json: @group_membership
  end

  # POST /group_memberships
  def create
    @group_membership = current_user.group_memberships
                                    .build(group_membership_params)

    if @group_membership.save
      render json: @group_membership,
             status: :created, location: @group_membership
    else
      render json: @group_membership.errors, status: :unprocessable_entity
    end
  end

  # Removed: No use case
  # PATCH/PUT /group_memberships/1
  # def update
  #   if @group_membership.update(group_membership_params)
  #     render json: @group_membership
  #   else
  #     render json: @group_membership.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /group_memberships/1
  def destroy
    @group_membership.destroy
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_group_membership
    @group_membership = current_user.group_memberships.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def group_membership_params
    params.require(:group_membership).permit(:group_id, :user_id)
  end

  private :set_group_membership, :group_membership_params
end
