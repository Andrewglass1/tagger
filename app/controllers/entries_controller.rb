class EntriesController < ApplicationController
  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
  end
  
  def create
    @entry = Entry.new(params[:entry])
    if @entry.save
      redirect_to entry_path(@entry), notice: 'entry was successfully created.'
    else
      render action: "new"
    end    
  end
end
