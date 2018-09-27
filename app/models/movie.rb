class Movie < ActiveRecord::Base
    # is this the right way to access things
   # attr_accessor :title, :rating, :release_date
    def get_all_ratings
        ratingsCollect = ['G', 'PG', 'PG-13', 'R']
        #hi hello is this correct way to set up a hash
        #ratingsCollect = Hash.new(0)
        #For each different rating... how do in Ruby
     #  ? .each do |movie|
           # whose values will be the value attribute of the checkbox (which is "1" 
           # by default, since we didn't specify another value when calling the 
           # check_box_tag helper
          #  ratingsCollect[movie.rating] = 1
         #   end
            return ratingsCollect
       end
end
