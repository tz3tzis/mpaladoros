class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable ,
         :omniauthable, :omniauth_providers => [:facebook]

     #Saving new user to the database 
     def self.from_omniauth(auth)
     	where (auth.slice(:provider,:uid)).first_or_initialize.tap do |user| 
     		user.provider = auth.provider
     		user.uid      = auth
     		user.name     = auth.info.name
     		user.oauth_token = auth.credentials.oauth_token
     		user.oauth_expires_at = Time.at(auth.credentials.expires_at)
     		user.save!
     	end
     end
end
