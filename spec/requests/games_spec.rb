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

  describe 'POST /games' do
    it 'creates the specified game' do
      game_request = attributes_for(:new_game)

      post '/games',
        params: game_request.to_json,
        headers: { 'Content-Type': 'application/json' }

        expect(response.status).to eq 201

        body = JSON.parse(response.body)
        game_title = body['title']
        expect(game_title) == game_request['title']
    end
  end

  describe 'PUT /games/:id' do
    it 'updates the specified game' do
      uuid = SecureRandom.uuid
      gameIdUrl = "/games/#{uuid}"
      FactoryGirl.create :game, id: uuid, title: 'E.T.'

      game_request = {
        id: "#{uuid}",
        title: 'Metal Gear Solid'
      }

      put gameIdUrl,
        params: game_request.to_json,
        headers: { 'Content-Type': 'application/json' }

        expect(response.status).to eq 200

        body = JSON.parse(response.body)
        game_title = body['title']
        expect(game_title) == game_request['title']
    end
  end

  describe 'POST /games/:id/vote' do
    it 'increments the specified game\'s vote count'  do
      uuid = SecureRandom.uuid
      gameIdUrl = "/games/#{uuid}/vote"
      FactoryGirl.create :game, id: uuid, votes: 4

      game_request = { id: "#{uuid}" }

      post gameIdUrl,
        params: game_request.to_json,
        headers: { 'Content-Type': 'application/json' }

        expect(response.status).to eq 200

        body = JSON.parse(response.body)
        game_votes = body['votes']
        expect(game_votes) == 5
    end
  end

  describe 'POST /games/clear' do
    it 'delete all games' do
      FactoryGirl.create :game, title: 'One'
      FactoryGirl.create :game, title: 'Two'
      FactoryGirl.create :game, title: 'Three'

      post '/games/clear'

      expect(response.status).to eq 204
    end
  end
end
