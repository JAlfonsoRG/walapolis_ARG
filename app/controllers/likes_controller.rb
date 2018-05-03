class LikesController < ApplicationController
  # POST  /likes/tgol/:user_id/:idea_id
  def the_god_of_likes
    user = User.find(params[:user_id])
    idea = Idea.find(params[:idea_id])
   
    if user.like_idea(idea)
      like = Like.where("user_id = ? AND idea_id = ?", user.id, idea.id).take
      like.destroy
    else
      Like.create(user_id: user.id, idea_id: idea.id)
    end
  end
end
