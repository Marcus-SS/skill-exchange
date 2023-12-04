class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :learn_skills
  has_many :teach_skills
  has_many :messages
  has_one_attached :photo

  after_create :attach_default_photo

  def matches
    Match.joins(
      "JOIN teach_skills AS ts_1 ON teach_skill_1_id = ts_1.id
      JOIN learn_skills AS ls_1 ON learn_skill_1_id = ls_1.id"
    ).where(
      "ts_1.user_id = #{id} OR
      ls_1.user_id = #{id}"
    )
  end

  def chatrooms
    Chatroom.where(match: matches)
  end

  def chatrooms_with_messages
    chatrooms.joins(:messages).order("messages.created_at DESC").uniq
  end

  private

  def attach_default_photo
    # Check if a photo is attached during user creation
    return if photo.attached?

    # Attach the default photo (replace 'default_image.jpg' with your actual default image name)
    photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'SkillExchange.png')), filename: 'SkillExchange.png', content_type: 'image/png')
  end
end
