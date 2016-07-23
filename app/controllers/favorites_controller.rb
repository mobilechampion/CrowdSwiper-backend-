# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  article_id :integer
#  status     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_favorites_on_article_id  (article_id)
#  index_favorites_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_00f2e522fe  (article_id => articles.id)
#  fk_rails_d15744e438  (user_id => users.id)
#

class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favorite

  #  POST articles/:id/like
  def like
    @favorite.like! if @favorite

    respond_to do |format|
      format.json { render json: { status: "success" }, status: :ok }
    end
  end

  def unlike
    @favorite.unlike! if @favorite

    respond_to do |format|
      format.json { render json: { status: "success" }, status: :ok }
    end
  end

  private

  def set_favorite
    @article = Article.find(params[:id])
    @favorite = Favorite.find_or_create_by(article: @article, user: current_user)
  end
end
