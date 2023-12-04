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

  private

  def attach_default_photo
    # Check if a photo is attached during user creation
    return if photo.attached?

    # Attach the default photo (replace 'default_image.jpg' with your actual default image name)
    photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'SkillExchange.png')), filename: 'SkillExchange.png', content_type: 'image/png')
  end
end
