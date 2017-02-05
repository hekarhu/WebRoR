class User < ActiveRecord::Base
include RatingAverage
has_many :ratings
has_secure_password
validates :username, uniqueness: true,
                       length: { minimum: 3,
				 maximum: 30}
validates :password, length:  {minimum: 4}
validates_format_of :password, with: /\A.*[^[:alpha:]]+.*\Z/

end
