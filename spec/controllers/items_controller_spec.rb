require 'rails_helper'

RSpec.describe ItemsController, type: :controller do


  describe 'GET #show' do


    it "renders the :show template" do
      user = create(:user)
      login_user user
      user_seller = create(:user_seller)
      brand = create(:brand)
      item = create(:item)
      get :show, params: { id: item.id }
      expect(response).to render_template :show
    end

  end

end
