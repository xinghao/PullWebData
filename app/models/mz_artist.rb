class MzArtist < ActiveRecord::Base
  set_inheritance_column "ruby_type"
  establish_connection :postgres_development  
  has_many :mz_artist_relations, :foreign_key=>"artist", :order => "weight desc"
end
