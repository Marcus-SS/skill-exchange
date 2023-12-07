class MatchesController < ApplicationController
  def index
    @matches = find_matches(current_user)
    # raise
  end

  def show
    @match = Match.find_by(id: params[:id])
  end

  def new
    @match = Match.new
  end

  def create
    find_matches(current_user)
  end

  def destroy
    @match = Match.find_by(id: params[:id])
    @match.destroy
    redirect_to matches_path
  end

  private

  def find_matches(user)
    matches = []
    User.where.not(id: user.id).each do |other_user|
      if has_matching_skills?(other_user.teach_skills, user.learn_skills) &&
         has_matching_skills?(other_user.learn_skills, user.teach_skills)
        matches << create_match(user, other_user)
      end
    end

    matches.uniq
  end

  def has_matching_skills?(skills1, skills2)
    skills1.each do |skill1|
      skills2.each do |skill2|
        return true if skill1.skill_id == skill2.skill_id
      end
    end
    false
  end

  def create_match(user, other_user)
    # Find matching teach skill in user's teach skills
    user_teach_skill = user.teach_skills.find { |teach_skill| has_matching_skills?([teach_skill], other_user.learn_skills) }

    # Find matching learn skill in user's learn skills
    user_learn_skill = user.learn_skills.find { |learn_skill| has_matching_skills?([learn_skill], other_user.teach_skills) }

    # Find matching teach skill in other_user's teach skills
    other_user_teach_skill = other_user.teach_skills.find { |teach_skill| has_matching_skills?([teach_skill], user.learn_skills) }

    # Find matching learn skill in other_user's learn skills
    other_user_learn_skill = other_user.learn_skills.find { |learn_skill| has_matching_skills?([learn_skill], user.teach_skills) }

    # Create a match with the found skills
    m = Match.new(
      teach_skill_1_id: user_teach_skill&.id,
      learn_skill_1_id: user_learn_skill&.id,
      teach_skill_2_id: other_user_teach_skill&.id,
      learn_skill_2_id: other_user_learn_skill&.id,
      status: 'Pending'
    )

    if m.save
      puts "Match created"
      # if Chatroom.find(other_user.id) == false
      # Chatroom.create(match_id: m.id) # go to the button 'Click to Message'
      return m
    else
      puts "Match existed"
      return Match.find_by(
        teach_skill_1_id: user_teach_skill&.id,
        learn_skill_1_id: user_learn_skill&.id,
        teach_skill_2_id: other_user_teach_skill&.id,
        learn_skill_2_id: other_user_learn_skill&.id
      )
    end
  end

  def match_params
    params.require(:match).permit(:teach_skill_1_id, :learn_skill_1_id, :teach_skill_2_id, :learn_skill_2_id)
  end
end
