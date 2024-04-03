class PlayersController < ApplicationController
  before_action :require_group
  before_action :set_player, only: %i[ show edit update destroy ]

  # GET /players or /players.json
  def index

    if params[:table].present?

      @players = current_group.players.order(:name)
    else
      @status = [current_group.active_players.to_a,
        current_group.inactive_players.to_a,
        current_group.expired_players.to_a
      ]
    end
  end

  # GET /players/1 or /players/1.json
  def show
    @quota_summary =  PlayerObjects::Quota.get(@player)
  end

  # GET /players/new
  def new
    @player = current_group.players.build
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players or /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to player_url(@player), notice: "Player was successfully created." }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1 or /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to player_url(@player), notice: "Player was successfully updated." }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1 or /players/1.json
  def destroy
    @player.destroy!

    respond_to do |format|
      format.html { redirect_to players_url, notice: "Player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def require_group
      cant_do_that(' - Not Authorized') unless current_group.present? 
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:group_id, :first_name, :last_name, :nickname, :use_nickname, :name, :tee, :quota, :rquota, :phone, :is_frozen, :last_played, :pin, :limited)
    end
end
