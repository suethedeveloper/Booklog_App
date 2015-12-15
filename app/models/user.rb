class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :readings
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :friendships

  # Noo friends table(model)in this app & friends are also users
  # to solve this issue, add class_name: "User"
  has_many :friends, through: :friendships, class_name: "User"

  #for comments
  # has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  
  #how many reader to show on one page. 
  self.per_page = 5
  
  def full_name
    "#{first_name} #{last_name}"        
  end   
  

  def self.search_by_name(name)
    names_array = name.split(' ')
    # names_array = name.downcase.split(' ')
    if names_array.size == 1
      where('first_name ILIKE ? or last_name ILIKE ?',
        "%#{names_array[0]}%", "%#{names_array[0]}%").order(:first_name)
    else
      where('first_name ILIKE ? or first_name ILIKE ? or last_name ILIKE ? or last_name ILIKE ?', 
    "%#{names_array[0]}%", "%#{names_array[1]}%", "%#{names_array[0]}%", "%#{names_array[1]}%").order(:first_name)
    end
  end

  def follows_or_same?(new_friend)
    friendships.map(&:friend).include?(new_friend) || self == new_friend
  end

  def current_friendship(friend)
    friendships.where(friend: friend).first
  end

end
