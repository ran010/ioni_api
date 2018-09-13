class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher
  mount_uploader :image, ImageUploader

  #acts_as_token_authenticatable
  before_create :confirmation_token


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :jwt_authenticatable, jwt_revocation_strategy: self


   def email_activate
     self.email_confirmed = true
     self.confirm_token = nil
     save!(:validate => false)
   end
   private
   def confirmation_token
     if self.confirm_token.blank?
         self.confirm_token = SecureRandom.urlsafe_base64.to_s
     end
   end

end
