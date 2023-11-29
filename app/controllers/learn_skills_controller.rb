class LearnSkillsController < ApplicationController
  def index
    @learn_skills = LearnSkill.all
  end

  def show
    @learn_skill = LearnSkill.find_by(id: params[:id])
  end

  def edit
    @learn_skill = LearnSkill.find_by(id: params[:id])
  end

  def update
    @learn_skill = LearnSkill.find_by(id: params[:id])
    @learn_skill.update(learn_skill_params)
    redirect_to profile_edit_path
  end

  def new
    @learn_skill = LearnSkill.new
    @learn_skills = LearnSkill.all
    @skills = Skill.all
  end

  def create
    @learn_skill = LearnSkill.new(learn_skill_params)
    @learn_skill.user = current_user
    if @learn_skill.save
      redirect_to profile_edit_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @learn_skill = LearnSkill.find(params[:id])
    @learn_skill.destroy
    redirect_to profile_edit_path
  end

  private

  def learn_skill_params
    params.require(:learn_skill).permit(:skill_id)
  end
end
