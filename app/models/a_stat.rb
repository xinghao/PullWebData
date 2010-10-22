# 0 -- not start
# 1 -- done
# 2 -- no similar artists
# 3 -- error
class AStat < ActiveRecord::Base
   belongs_to :artist
end
