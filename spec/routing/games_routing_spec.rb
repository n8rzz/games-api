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

    it 'routes to #vote' do
      expect(:post => '/games/1/vote').to route_to('games#vote', :id => '1')
    end

    it 'routes to #owned' do
      expect(:post => '/games/1/owned').to route_to('games#owned', :id => '1')
    end

    it 'routes to #clear' do
      expect(:post => '/games/clear').to route_to('games#clear')
    end
  end
end
