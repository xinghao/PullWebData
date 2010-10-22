class SimilarArtistScore
    def initialize
      @score = 0
      @appearance = 0
      @lastfm = 0.1
      @mz = 0.001
      @echonest = 0.00001
      @yahoomusic = 0.0000001
      @mtv = 0.000000001
    end

  # add to current score and apperance
  # if duplicate then the score will be sum and appearance time will increment 1
  def calculate(position,datasource_type) 
    
    if datasource_type == "mz"
      weight = @mz
    elsif datasource_type == "lastfm"
      weight = @lastfm 
    elsif datasource_type == "echonest"
      weight = @echonest
    elsif datasource_type == "yahoomusic"
      weight = @yahoomusic
    elsif datasource_type == "mtv"
      weight = @mtv
    end   
    
    #puts "current score:"+ @score.to_s + " more score:"+ (weight/position).to_s
    @score = @score + weight/position
    @appearance = @appearance + 1
    
    return @score + @appearance  
  end
  
  def getScore
    return @score + @appearance
  end
  

end
