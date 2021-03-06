class PagesController < ApplicationController
  def home 
    redirect_to articles_path if session[:user_id]
  end

  def about
  end

  def search
    if params[:search].blank?
      flash[:notice] = "Search field is empty"
      redirect_to root_path
    else
      parameter = params[:search].downcase
      @articles = Article.all.where("lower(title) LIKE ?", "%#{parameter}%").or(Article.all.where("lower(description) LIKE ?", "%#{parameter}%")).or(Article.all.where("lower(post) LIKE ?", "%#{parameter}%")).uniq
      if @articles.count == 0
        flash[:notice] = "No results found"
      end
    end
  end
end
