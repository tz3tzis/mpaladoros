class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,  :rememberable, :trackable, :validatable ,
         :omniauthable, :omniauth_providers => [:facebook]

  geocoded_by :ip
  after_validation :geocode 

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
      user.ip = user.current_sign_in_ip.to_s
	    #user.image = URI.parse(auth.info.avatar) if auth.info.avatar?
      user.save!
  	end  	
  end

  def largeimage
    "http://graph.facebook.com/#{self.uid}/picture?type=large"
  end
  def normalimage
    "http://graph.facebook.com/#{self.uid}/picture?type=normal"
  end
  def smallimage
    "http://graph.facebook.com/#{self.uid}/picture?type=small"
  end


end
