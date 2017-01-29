class Beer < ActiveRecord::Base
belongs_to :brewery
has_many :ratings
def average_rating
 if ratings.count != 0
    average =0.0
    total = 0.0  
    ratings.map do |rating|
    total = total + rating.score
 end
    average = total / ratings.count
    "#{average}"
 else
    "0"
 end
end
def to_s
    "#{self.name}, #{brewery.name}"
end
end
