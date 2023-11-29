class TeachSkillsController < ApplicationController
  def index
    @teach_skills = TeachSkill.all
  end

  def edit
    @teach_skill = TeachSkill.find_by(id: params[:id])
  end

  def update
    @teach_skill = TeachSkill.find_by(id: params[:id])
    @teach_skill.update(teach_skill_params)
    redirect_to profile_edit_path
  end

  def new
    @teach_skill = TeachSkill.new
    @teach_skills = TeachSkill.all
    @skills = Skill.all
  end

  def create
    @teach_skill = TeachSkill.new(teach_skill_params)
    @teach_skill.user = current_user
    if @teach_skill.save
      redirect_to profile_edit_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @teach_skill = TeachSkill.find(params[:id])
    @teach_skill.destroy
    redirect_to profile_edit_path
  end

  private

  def teach_skill_params
    params.require(:teach_skill).permit(:skill_id, :mode, :level)
  end
end
