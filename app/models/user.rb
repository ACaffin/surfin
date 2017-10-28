class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #critère de validation qui dit que le full name ne doit pas fiare puls de 50 caractères
  validates :fullname, presence:true, length: {maximum: 50}
end
