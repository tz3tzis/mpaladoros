class User < ApplicationRecord

  belongs_to :team

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,  :rememberable, :trackable, :validatable ,
         :omniauthable, :omniauth_providers => [:facebook]

  

  def self.new_with_session(params,session)
  	super.tap do |user|
  		if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  			user.email = data["email"] if user.email.blank?
  		end
  	end
  end

  #Saving new user to the database 
  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.name = auth.info.name
	    user.image = auth.info.avatar
      user.save!
  	end  	
  end
end
