class MzArtistRelation < ActiveRecord::Base
  establish_connection :postgres_development
  belongs_to :mz_artist
end
