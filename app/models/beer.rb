class Beer < ActiveRecord::Base
  include RatingAverage

  belongs_to :brewery
  has_many :ratings, dependent: :destroy
has_many :raters, through: :ratings, source: :user
validates_presence_of :name
  def average
    if ratings.count == 0
      return 0
    end
    ratings.map{ |r| r.score }.sum / ratings.count.to_f
  end
  def to_s
    "#{name} #{brewery.name}"
  end
end
