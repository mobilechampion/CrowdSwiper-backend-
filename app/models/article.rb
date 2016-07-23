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

class Article < ActiveRecord::Base
  IMPORTANCE = {
                  article_views: 17,
                  article_swipes: 23,
                  domain_name_score: 12,
                  submitter_user_score: 33,
                  inappropriate_flags: -20,
                  swipe_per_hour: 15
                }

  PERFECR_SCORE = {
                    article_views: 100,
                    article_swipes: 50,
                    domain_name_score: 5,
                    submitter_user_score: 10,
                    inappropriate_flags: 5,
                    swipe_per_hour: 20
                  }

  PER_PAGE = 20

  belongs_to :user
  has_many :favorites
  has_many :votes

  validates :user, presence: true
  validates :title, presence: true
  validates :url, presence: true, uniqueness: true

  scope :today, -> { where(created_at: DateTime.now.beginning_of_day..DateTime.now.end_of_day) }
  scope :approved, -> { where(approved: true) }

  def voted? user
    votes.find_by(user: user).present?
  end

  def favorited? user
    Favorite.like.find_by(article: self, user: user).present?
  end
end
