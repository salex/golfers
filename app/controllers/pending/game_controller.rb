class Pending::GameController < ApplicationController
  before_action :set_game

  def show
    # @game = GamePending.find(params[:id])
    # @game.set_state
  end

  # def edit
  # end

  # def update
  # end

  def adjust_teams
    # @game = GamePending.find(params[:id])
    # @game.set_state

  end

  def swap_teams
    # @game = GamePending.find(params[:id])
    # @game.set_state
  end


  def update_teams
    # @game = GamePending.find(params[:id])

    respond_to do |format|
      if @game.adjust_teams(params)
        # Games::Teams::Form.assign_teams(@game)
        format.html { redirect_to @game.namespace_url, notice: 'Game Teams successfully assigned.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { redirect_to root_path }
      end
    end
  end

  def score_teams
    # @game = GamePending.find(params[:id])
    # @game.set_state
  end

  def update_scores
    # @game = current_group.games.find_by(id:params[:id], status:['Pending','Scored'])
    respond_to do |format|
      if ScoreRounds.new(@game,participant_params)
        flash.now[:notice] = 'Scoring Game Teams was successfull.'
        format.html { redirect_to @game.namespace_url, notice: 'Score Game Teams was successfull.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { redirect_to score_teams_path(@event), alert: "Score Events Teams was NOT successfull: #{@event.errors.messages}"}
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_game
    @game = current_group && GamePending.find_by(id:params[:id])
    if @game.blank?
      cant_do_that(' - Pending game not found') 
    # elsif !current_user.can?(:update,:game)
    #   cant_do_that(' - Not Permitted') 
    else
      @game.set_state
    end

  end


  def participant_params
    params.permit!.to_h
  end


end
