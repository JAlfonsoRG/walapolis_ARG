class StaticPagesController < ApplicationController
  def home
    if params[:categoria]
      #Enviar ideas de la categoria
      @ideas = Idea.includes(:category_ideas).where("category_ideas.category_id" => params[:categoria])
    elsif params[:search]      
      #find ideas using params
      @ideas = Idea.where("title ILIKE ?", "%#{params[:search]}%")
    elsif params[:filter]
      if params[:filter] == 'most-popular'
        #@ideas = Idea.all.sort_by(&:total_likes).reverse
        @ideas = Idea.all.sort_by{|idea| idea.total_likes}.reverse
      elsif params[:filter] == 'most-recent'
        @ideas = Idea.all.order('id desc')
      else
        @ideas = Idea.all.order('id asc')
      end      
    else
      #Enviar todas las ideas
      @ideas = Idea.all        
    end
  end
end
