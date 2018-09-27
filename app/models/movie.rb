class Movie < ActiveRecord::Base
    attr_accessor :title, :rating, :release_date
    def get_all_ratings
        #hi hello is this correct way to set up a hash
        ratingsCollect = Hash.new(0)
        #get rating from each movie... how do in Ruby
       ? .each do |movie|
            ratingsCollect[movie.rating] =
            end
            return ratingsCollect
       end
end
