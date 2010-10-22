class MzDataSourceHandler < DataSource
    def initialize
      @DataSourceType = "mz"  
      @ReDoAll = false
      @ReDoError = false
      @ReDo1 = false
      @ReDo2 = false
      @ReDo3 = false
      @ReDo4 = false
      @ReDo5 = false      
    end

  def getSimilarArtistId artist
      
      mz_art = MzArtist.find_by_gid(artist.music_brainz_id)
      
      if (mz_art == nil)
        return 2
      end
      
      
      #before doing anything clean the table
      RelateMusicbrainz.delete_all(:altnet_id => artist.id)
      
      iCount = 0
      
      mz_art.mz_artist_relations.each do |relation|
        begin
          ref_mz_artist_id = relation.ref
          mz_art = MzArtist.find(ref_mz_artist_id)
          ref_artist_gid = mz_art.gid
          ref_artist = Artist.find_by_music_brainz_id(ref_artist_gid)
          if (ref_artist == nil)
            next
          end
          rm = RelateMusicbrainz.new
          rm.altnet_id = artist.id
          rm.similar_artist_id = ref_artist.id
          rm.score = relation.weight
          iCount = iCount + 1
          rm.position = iCount
          rm.save
        rescue Exception => e
          puts e
          return 4
        end 
           
      end # end of iteration
      
      if (iCount > 0)
        return 1
      else
        return 3
      end
  end 
  
end
