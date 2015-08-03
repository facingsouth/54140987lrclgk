class Playlist < ActiveRecord::Base
  belongs_to :user

  has_many :playlist_selections, :dependent => :destroy
  has_many :songs, :through => :playlist_selections

  validates :name,
            :presence => true,
            :uniqueness => true

  validates :user_id, :presence => true
end
