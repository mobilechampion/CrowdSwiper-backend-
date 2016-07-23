class ArticleRankingCalculation

  DOMAIN_NAME_SCORE = 5
  INAPPROPRIATE_FLAGS = 0
  PERFECT_SCORE_DIVISION = 10
  IMPORTANCE_DIVISION = 100

  def initialize(article)
    @article = article
  end

  def calculation
    total_score = 0
    data = {
              article_views: @article.total_view,
              article_swipes: @article.votes.sum(:value),
              domain_name_score: DOMAIN_NAME_SCORE,
              submitter_user_score: @article.score, # TODO: Check this: user's score ??
              inappropriate_flags: INAPPROPRIATE_FLAGS,
              swipe_per_hour: swipe_per_hour
           }

    data.each do |criteria, value|
      total_score += (data[criteria] / (Article::PERFECR_SCORE[criteria].to_f/PERFECT_SCORE_DIVISION)) * Article::IMPORTANCE[criteria].to_f / IMPORTANCE_DIVISION
    end

    total_score
  end

  def swipe_per_hour
    hours_from_created = ((Time.now.utc - @article.created_at).to_f / 3600.0)
    @article.favorites.size.to_f / hours_from_created
  end
end
