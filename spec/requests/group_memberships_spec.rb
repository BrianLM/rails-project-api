require 'rails_helper'

RSpec.describe "GroupMemberships", type: :request do
  describe "GET /group_memberships" do
    it "works! (now write some real specs)" do
      get group_memberships_path
      expect(response).to have_http_status(200)
    end
  end
end
