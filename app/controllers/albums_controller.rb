class AlbumsController < ApplicationController

  def index
    # Code for listing all albums goes here.
    @albums = Album.all
    render :index
  end

  def new
    # Code for new album form goes here.
    @album = Album.new
    render :new
  end

  def create
    # Code for creating a new album goes here.
    @album = Album.new(album_params)
    if @album.save
      flash[:notice] = "Album successfully added!"
      redirect_to albums_path
    else
      render :new   
    end
  end

  def edit
    # Code for edit album form goes here.
    @album = Album.find(params[:id])
    render :edit
  end

  def show
    # Code for showing a single album goes here.
    @album = Album.find(params[:id])
    render :show
  end

  def update
    # Code for updating an album goes here.
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to albums_path
    else
      render :edit
    end
  end

  def destroy
    # Code for deleting an album goes here.
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  private
  def album_params
    params.require(:album).permit(:name, :genre)
  end
end