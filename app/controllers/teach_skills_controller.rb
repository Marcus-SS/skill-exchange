class TeachSkillsController < ApplicationController
  def index
    @teach_skills = TeachSkill.all
  end


  def new
    @teach_skill = TeachSkill.new
  end

  def create
    @teach_skill = TeachSkill.new(teach_skill_params)
    if @teach_skill.save
      redirect_to teach_skill_path(@teach_skill)
    else
      render :new
    end
  end

  def destroy
    @teach_skill = TeachSkill.find_by(id: params[:id])
    @teach_skill.destroy
    redirect_to teach_skills_path
  end

  private

  def teach_skill_params
    params.require(:teach_skill).permit(:user_id, :skill_id)
  end
end
