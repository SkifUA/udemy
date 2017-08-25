class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def name
    name = full_name
    name.present? ? name : self.email
  end

  def full_name
    [self.first_name, self.last_name].join( ' ').strip
  end
end