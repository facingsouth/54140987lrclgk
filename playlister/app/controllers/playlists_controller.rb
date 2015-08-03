class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(whitelisted_playlist_params)
    if @playlist.save
      flash[:sucess] = "You have created a new playlist!"
      redirect_to root_path # Do not have a show yet, redirect to root for now
    else
      flash[:error] = "Oops! Your playlist cannot be created! Try again!"
      render :new
    end
  end

  private

  def whitelisted_playlist_params
    params.require(:playlist).permit(:name,
                                     :user_id,
                                     :song_ids => [])
  end
end
