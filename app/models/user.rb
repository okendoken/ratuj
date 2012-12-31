class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :nickname
  # attr_accessible :title, :body

  has_many :authorizations

  has_many :problems

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:email => data.email).first
      user
    else
      # Create a user with a stub password.
      user = User.create!(:email => data.email, :password => Devise.friendly_token[0,20], :nickname => data.name)
      auth = user.authorizations.build(:uid => access_token['uid'], :token => access_token['credentials']['token'],
                                       :secret => nil, :name => data.name, :link => data.link, :provider => 'facebook')
      user.authorizations << auth
      user
    end
  end

  def self.search(query)
    if query and !query.empty?
      where('name email ?', "%#{query}%")
    else
      all
    end
  end
end
