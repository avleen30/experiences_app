class User < ApplicationRecord

  has_secure_password

  has_many :events
  has_many :ratings
  has_many :posts

  # mount_uploader :avatar, AvatarUploader



  validates_uniqueness_of :email, case_sensitive: false, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates_processing_of :image
  # validate :image_size_validation

   def full_name
    "#{first_name} #{last_name}"
  end


  def user_params
    params.require(:user).permit(:name, :about, :cover,
                                 :sex, :dob, :location, :phone_number)
  end

  def self.authenticate_with_credentials(email, password)
    new_email = email.downcase
    user = User.find_by_email(new_email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

 def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  private
  # def image_size_validation
  #   errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  # end

end

