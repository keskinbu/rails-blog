class StylesController < ApplicationController
  
  def show
    @style = Style.find(params[:id])
    @articles = @style.articles.paginate(page: params[:page], per_page: 4)
  end
  
  def new
    @style = Style.new
  end
  
  def create
    @style = Style.new(style_params)
    if @style.save
      flash[:success] = "Style was created succesfully"
      redirect_to articles_path
    else
      render 'new'
    end
  end
  
  private
  
  def style_params
    params.require(:style).permit(:name)  
  end
  
end