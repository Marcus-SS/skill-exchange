class LearnSkillsController < ApplicationController
  def index
    @learn_skills = LearnSkill.all
  end

  def show
    @learn_skill = LearnSkill.find_by(id: params[:id])
  end

  def new
    @learn_skill = LearnSkill.new
  end

  def create
    @learn_skill = LearnSkill.new(learn_skill_params)
    if @learn_skill.save
      redirect_to learn_skill_path(@learn_skill)
    else
      render :new
    end
  end

  def destroy
    @learn_skill = LearnSkill.find_by(id: params[:id])
    @learn_skill.destroy
    redirect_to learn_skills_path
  end

  private

  def learn_skill_params
    params.require(:learn_skill).permit(:user_id, :skill_id)
  end
end
