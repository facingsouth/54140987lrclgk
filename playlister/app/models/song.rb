class Song < ActiveRecord::Base
  has_many :playlist_selections
  has_many :playlists, :through => :playlist_selections

  def description
    "#{name} by #{artist}"
  end
end
