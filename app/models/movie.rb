class Movie < ActiveRecord::Base
    def self.get_all_ratings
        ratingsCollect = ['G', 'PG', 'PG-13', 'R']
        return ratingsCollect
     end
end
