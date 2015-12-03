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

end
