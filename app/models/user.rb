class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :learn_skills
  has_many :teach_skills
  has_many :messages
  has_many :notifications, as: :recipient, dependent: :destroy
  has_one_attached :photo

  after_create :attach_default_photo

  def matches
    Match.joins(
      "JOIN teach_skills AS ts_1 ON teach_skill_1_id = ts_1.id
      JOIN learn_skills AS ls_1 ON learn_skill_1_id = ls_1.id
      JOIN teach_skills AS ts_2 ON teach_skill_2_id = ts_2.id
      JOIN learn_skills AS ls_2 ON learn_skill_2_id = ls_2.id"
    ).where(
      "(ts_1.user_id = #{id} AND
      ls_1.user_id = #{id}) OR
      (ts_2.user_id = #{id} AND
      ls_2.user_id = #{id})"
    )
  end

  def chatrooms
    Chatroom.joins(:messages).where(match: matches).order("messages.created_at DESC").uniq
  end

  def chatrooms_with_messages
    chatrooms.joins(:messages).order("messages.created_at DESC").uniq
  end

  def unread_messages
    notifications.unread.select { |notification| notification.params[:type] == 'message' }
  end

  private

  def attach_default_photo
    # Check if a photo is attached during user creation
    return if photo.attached?

    # Attach the default photo (replace 'default_image.jpg' with your actual default image name)
    photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'user.png')), filename: 'user.png', content_type: 'image/png')
  end
end
