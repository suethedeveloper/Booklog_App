class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :readings
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  #how many reader to show on one page. 
  self.per_page = 5
  
  def full_name
    "#{first_name} #{last_name}"        
  end       
end
