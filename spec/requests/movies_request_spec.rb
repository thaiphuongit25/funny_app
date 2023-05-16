require 'rails_helper'

RSpec.describe 'Movies', type: :request do
  describe 'POST /sign_in' do
    context 'when create successfully' do
      it 'return successful message' do
        user = FactoryBot.create :user, email: 'test@gmail.com', password: '12345678'
        login_as(user)

        post '/movies', params: { movie: {youtube_url: 'https://www.youtube.com/watch?v=zRGQL3iUVg4'}}
        expect(response).to redirect_to(:root)
        follow_redirect!
        expect(response).to render_template(:index)
        expect(response.body).to include('Share video successfully')
      end

      it 'return faily message' do
        user = FactoryBot.create :user, email: 'test@gmail.com', password: '12345678'
        login_as(user)

        post '/movies', params: { movie: {youtube_url: 'https://www.youtube.com/watch?v=test_youtube_id_invalid'}}
        expect(response).to render_template(:share)
        expect(response.body).to include('Your video is invalid')
      end
    end
  end
end
