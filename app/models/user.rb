class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :galleries

  after_create :send_admin_mail
  def send_admin_mail
    UserMailer.welcome_email(self).deliver_now
  end

  def password_genrator
    a = [*('a'..'z')].sample(2).join
     b = [*(0 .. 9)].sample(7).join
     c = [*('A' .. 'Z')].sample(1).join
     d = a + b + c
     return d
  end
end
