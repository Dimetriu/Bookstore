class Admin < ApplicationRecord
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable,
         :validatable,
         :lockable,
         :timeoutable
end
