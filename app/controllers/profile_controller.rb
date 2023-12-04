class ProfileController < ApplicationController

  def edit
    @user = current_user
    @teach_skills = TeachSkill.where(user: current_user)
    @learn_skills = LearnSkill.where(user_id: current_user.id)
  end


  def destroy
    @learn_skill = LearnSkill.find_by(id: params[:id])
    @learn_skill.destroy
    redirect_to learn_skills_path
  end

  def update
    @user = current_user
    @user.update(params_user)
    redirect_to profile_show_path
  end

  def show
    @user = current_user
    @teach_skills = TeachSkill.where(user_id: current_user.id)
    @learn_skills = LearnSkill.where(user_id: current_user.id)
  end

  def other
    @user = User.find_by(id: params[:id])
    @teach_skills = TeachSkill.where(user_id: @user.id)
    @learn_skills = LearnSkill.where(user_id: @user.id)
    @matched_teach_skills = @teach_skills.where(skill_id: current_user.learn_skills.pluck(:skill_id))
    @matched_learn_skills = @learn_skills.where(skill_id: current_user.teach_skills.pluck(:skill_id))
    @matches = Match.where(teach_skill_1_id: current_user.teach_skill_ids, teach_skill_2_id: @user.teach_skill_ids)

    # @match = Match.where(learn_skill_1:)
  end

  private

  def params_user
    params.require(:user).permit(:id, :name, :age, :gender, :city, :bio, :availibility, :photo)
  end
end
