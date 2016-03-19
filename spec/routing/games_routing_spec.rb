require 'rails_helper'

describe GamesController, :type => :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/games').to route_to('games#index')
    end

    it 'routes to #show' do
      expect(:get => '/games/1').to route_to('games#show', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/games').to route_to('games#create')
    end

    it 'routes to #update' do
      expect(:put => '/games/1').to route_to('games#update', :id => '1')
    end
  end
end
