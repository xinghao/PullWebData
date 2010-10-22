# 0 --- init
# 1 --- done
# 2 --- artist not match in datasource
# 3 --- no pupularity
# 4 --- other errors
# 5 --- rawdata done
# 6 --- anaylze not match
# 7 --- anaylze error
class PopularPStat < ActiveRecord::Base
  belongs_to :artist
end
