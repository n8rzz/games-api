require 'rails_helper'
require 'securerandom'

describe 'Games', :type => :request do
  describe 'GET /games' do
    it 'returns all the games' do
      FactoryGirl.create :game, title: 'First Game'
      FactoryGirl.create :game, title: 'Second Game'

      get '/games'

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      game_titles = body.map{|game| game['title']}
      expect(game_titles).to match_array(['First Game', 'Second Game'])
    end
  end

  describe 'GET /games/:id' do
    it 'returns the specified game' do
      uuid = SecureRandom.uuid
      gameIdUrl = "/games/#{uuid}"
      FactoryGirl.create :game, id: uuid

      get gameIdUrl

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      game_title = body['title']
      expect(game_title) == 'First Game'
    end
  end
end
