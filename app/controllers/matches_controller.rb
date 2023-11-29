class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
    @match = Match.find_by(id: params[:id])
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to match_path(@match)
    else
      render :new
    end
  end

  def destroy
    @match = Match.find_by(id: params[:id])
    @match.destroy
    redirect_to matches_path
  end

  private

  def match_params
    params.require(:match).permit(:teach_skill_1_id, :learn_skill_1_id, :teach_skill_2_id, :learn_skill_2_id)
  end
end
