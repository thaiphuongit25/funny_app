require 'rails_helper'

RSpec.describe 'Sessions', type: :request do

  describe 'POST /create' do
    context 'when login successfully' do
      it 'return successful message' do
        post '/sign_in', params: { user: {email: 'test@gmai.com', encrypted_password: '12345678' }}
        expect(response).to redirect_to(:root)
        follow_redirect!
        expect(response).to render_template(:index)
        expect(response.body).to include('Login successfully')
      end
    end

    context 'when login faily' do
      let!(:user) {FactoryBot.create :user, email: 'phuongnguyenit25@gmail.com', password: '12345678'}

      it 'the email is blank' do
        post '/sign_in', params: { user: {email: '', encrypted_password: '12345678' }}
        expect(response).to redirect_to(:root)
        follow_redirect!
        expect(response.body).to include('Email can&#39;t be blank')
      end

      it 'the email is invalid' do
        post '/sign_in', params: { user: {email: 'test', encrypted_password: '12345678' }}
        expect(response).to redirect_to(:root)
        follow_redirect!
        expect(response.body).to include('Email is invalid')
      end

      it 'the password is wrong' do
        post '/sign_in', params: { user: {email: 'phuongnguyenit25@gmail.com', encrypted_password: '12345678' }}
        expect(response).to redirect_to(:root)
        follow_redirect!
        expect(response.body).to include('Email or Password are wrong')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'logout successfully' do
      delete '/logout'
      expect(response).to redirect_to(:root)
      follow_redirect!
      expect(response.body).to include('Logout successfully')
    end
  end
end
