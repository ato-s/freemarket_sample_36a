require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  describe 'GET #show' do

    let(:user) { create(:user) }

    before do
      login_user(user)
    end

    before do
      seller = create(:user,id:"2", email: "test_user2@gmail.com", nickname: "test_user2", password: "11111111", password_confirmation: "11111111" )
      brand = create(:brand)
      size_type = create(:size_type)
            size = create(:size)
      u_category = create(:upper_category)
      m_category = create(:middle_category)
      l_category = create(:lower_category)
      item = create(:item,seller_id:"2")
      info = create(:information)
      user_info =  create(:user_information)
    end

    it "renders the :show template" do
      get :show, params: { id: 1 }
      expect(response).to render_template :show
    end

  end
end
