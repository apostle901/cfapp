require 'rails_helper'

describe UsersController, :type => :controller do
  before do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user, last_name: "Smith")
  end
  
  describe 'GET #show' do
    context 'User is logged in' do
      before do
        sign_in @user
      end

      it 'loads correct user details' do
        get :show, id: @user.id
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end
    end

    context 'No user is logged in' do
      it 'redirects to login' do
        get :show, id: @user.id
        expect(response).to redirect_to(user_session_path)
      end
    end

    context 'user2 accesses user1 page' do
      before do
        sign_in @user2
      end
      it 'cannot access other user page' do
        get :show, id: @user.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

end
