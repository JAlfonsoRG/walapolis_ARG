class StaticPagesController < ApplicationController
  def home
    if params[:categoria]
      #Enviar ideas de la categoria
      @ideas = Idea.includes(:category_ideas).where("category_ideas.category_id" => params[:categoria])
    else
      #Enviar todas las ideas
      @ideas = Idea.all
    end
  end
end
