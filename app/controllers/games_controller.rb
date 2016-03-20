class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]

  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # POST /games/1/vote
  def vote
    @game = Game.find(params[:id])

    if @game.increment!(:votes, 1)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # POST /games/1/owned
  def owned
    @game = Game.find(params[:id])

    if @game.status == 'wantit'
      @game.status = 'ownit'

      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # POST /games/clear
  def clear
    @games = Game.all
    @games.delete_all

    render json: @games
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.require(:game).permit(:id, :title, :votes, :status)
    end
end
