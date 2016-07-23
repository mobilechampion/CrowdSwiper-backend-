# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string(255)
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  total_view :integer          default(0)
#  score      :integer          default(5)
#  approved   :boolean          default(FALSE)
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_3d31dad1cc  (user_id => users.id)
#

class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :queue]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.approved.includes(:votes)

    data = articles_data(@articles)
    data = data.sort! { |obj1, obj2|  obj1[:total_score].to_f <=> obj2[:total_score].to_f }.reverse.take(20)

    render json: { data: { articles: data }, status: 'success' }, status: :ok
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article.update(total_view: @article.total_view + 1)
    article_data = @article.as_json
    article_data.merge!(
      total_votes: @article.votes.size,
      total_vote_points: @article.votes.sum(:value),
      averaged_votes: (@article.votes.sum(:value) / @article.votes.size).to_f.round(3),
      voted: current_user ? @article.voted?(current_user) : false
    )

    respond_to do |format|
      format.json { render json: { data: { article: article_data }, status: 'success' }, status: :ok }
    end
  end

  # POST /articles
  # POST /articles.json
  def create
    begin
      ActiveRecord::Base.transaction do
        @article = current_user.articles.new(article_params)
        raise Exception, custom_errors(@article) unless @article.save

        vote = Vote.new(article: @article, user: current_user, value: params[:vote].to_f)
        raise Exception, custom_errors(vote) unless vote.save
      end
    rescue Exception => e
      respond_to do |format|
        format.json { render json: { errors: e.message, status: 'error' }, status: :unprocessable_entity }
      end
      return false
    end

    respond_to do |format|
      format.json { render json: { data: { article: @article, vote: @article.votes.where(user: current_user).first.value }, status: 'success' }, status: :created }
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      unless @article.user == current_user
        format.json { render json: { data: { article: @article }, errors: 'Permission denied', status: 'error' }, status: :unprocessable_entity }
      end

      if @article.update(article_params)
        format.json { render json: { data: { article: @article }, status: 'success' }, status: :ok }
      else
        format.json { render json: { data: { article: @article }, errors: custom_errors(@article), status: 'error' }, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.json { render json: { data: nil, status: 'success' }, status: :no_content }
    end
  end

  # GET users/:id/submit_articles
  def submit_articles
    user = User.find(params[:id])
    @articles = user.articles.page(params[:page]).per(Article::PER_PAGE)
    data = articles_data(@articles)
    respond_to do |format|
      format.json { render json: { data: { articles: data }, per_page: Article::PER_PAGE, status: "success" }, status: :ok }
    end
  end

  def queue
    articles = Article.today.joins("LEFT OUTER JOIN users ON articles.user_id = users.id").page(params[:page]).per(Article::PER_PAGE)
    data = articles_data(articles)
    render json: { data: { articles: data }, per_page: Article::PER_PAGE, status: 'success', page: params[:page] }
  end

  def favorites
    articles = Article.joins(:favorites).where(favorites: {status: Favorite.statuses[:like], user: current_user }).page(params[:page]).per(Article::PER_PAGE)
    data = articles_data(articles)

    respond_to do |format|
      format.json { render json: { data: { articles: data }, per_page: Article::PER_PAGE, status: "success" }, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.fetch(:article, {}).permit(:title, :url, :approved)
    end

  def articles_data(articles)
    data = []

    articles.each do |article|
      total_votes_point = article.votes.sum(:value)
      data << article.as_json.merge(
        total_votes: article.votes.size,
        total_vote_points: total_votes_point,
        averaged_votes: (total_votes_point / article.votes.size).to_f.round(3),
        total_score: (ArticleRankingCalculation.new(article).calculation).to_f.round(3),
        favorited: current_user ? article.favorited?(current_user) : false,
        user: article.user.slice(:email, :name, :nickname, :image)
      )
    end

    data
  end
end
