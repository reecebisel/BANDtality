class Playlist < ActiveRecord::Base
  belongs_to :user
  belongs_to :profile
  belongs_to :visual_artist
  belongs_to :musician
  belongs_to :venue_rep
end
