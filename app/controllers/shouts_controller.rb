class ShoutsController < ApplicationController
    def create
    @shout = Shout.new(params[:shout])
    if @shout.save
      flash[:notice] = 'Shout created.'
    else
      flash[:error] = @shout.errors
    end
    redirect_to root_url
  end
  
  def update
    @shout = Shout.find(params[:id])
    if @shout.update_attributes(params[:shout])
      redirect_to root_url, :notice => 'Shout updated.'
    else
      render :action => 'edit'
    end
  end
  
  def edit
    @shout = Shout.find(params[:id])
  end
  
  def destroy
    @shout = Shout.find(params[:id])
    @shout.destroy
    redirect_to root_url, :notice => 'Shout deleted.'
  end
  
  def show
    @shout = Shout.find(params[:id])
  end
  
  def index
    @shouts = Shout.most_recent
    @shout = Shout.new
  end

end
