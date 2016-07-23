# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  value      :float(24)
#  user_id    :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_votes_on_article_id  (article_id)
#  index_votes_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_041a10f835  (article_id => articles.id)
#  fk_rails_c9b3bef597  (user_id => users.id)
#

class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vote

  #  POST articles/:id/vote
  def create
    respond_to do |format|
      if @vote.update(value: params[:value])
        data = {
            total_votes: @article.votes.size,
            total_vote_points: @article.votes.sum(:value),
            averaged_votes: (@article.votes.sum(:value) / @article.votes.size).to_f.round(3)
        }

        format.json { render json: { data: data, status: "success" }, status: :ok }
      else
        format.json { render json: { errors: custom_errors(@vote), status: 'error' }, status: :unprocessable_entity }
      end

    end
  end

  private

  def set_vote
    @article = Article.find(params[:id])
    @vote = Vote.find_or_create_by(article: @article, user: current_user)
    render json: { status: "success", message: "You have voted" } and return unless @vote.new_record?
  end
end
