require 'rails_helper'

RSpec.describe MovieService do
  describe 'Get infor' do
    context 'when youtube_url is true' do
      let(:youtube_url) { 'https://www.youtube.com/watch?v=xvQYZu8D8zw' }
      let(:movie_service) { MovieService.new(youtube_url) }
      it 'get all infor' do
        expect(movie_service.infor[:title].present?).to eq true
        expect(movie_service.infor[:description].present?).to eq true
      end
    end

    context 'when youtube_url is false' do
      let(:youtube_url) { 'https://www.youtube.com/watch?v=test_id_false' }
      let(:movie_service) { MovieService.new(youtube_url) }

      it "don't get infor" do
        expect(movie_service.infor[:title].present?).to eq false
      end
    end
  end
end
