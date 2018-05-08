class User < ApplicationRecord
  # after_create :send_welcome_email
  has_one_attached :image
  has_many :ideas, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.full_name = auth.info.name
      # user.image = auth.info.image # assuming the user model has an image
      # require 'open-uri'
      # user.image.attach(io: File.new(open(auth.info.image.to_s)), filename: "#{auth.info.email}-#{rand(100)}", content_type: "image/jpg")
#No siempre funciona la línea de arriba


      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def first_name
    self.full_name.blank? ? self.email : self.full_name.split(" ")[0]
  end
  
  def like_idea(idea)
    like = Like.where("user_id = ? AND idea_id = ?", self.id, idea.id).first
    if like.present?
      return true
    else
      return false
    end
  end
  
  def send_welcome_email
    require 'mailgun'   
    # First, instantiate the Mailgun Client with your API key
    mg_client = Mailgun::Client.new "#{ENV['MAILGUN_API_KEY']}"    
    # Define your message parameters
    message_params =  { from: 'hola@walapolis.com',
                        to: self.email,
                        subject: '¡Bienvenido a Walapolis!',
                        text:    "WOW! #{self.full_name} Ya estás dentro de Walapolis :D"
                      }   
    # Send your message through the client
    mg_client.send_message 'mg.ixolab.com', message_params
  end

end