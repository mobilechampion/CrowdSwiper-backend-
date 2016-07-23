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

class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  validates :value, numericality: true, inclusion:  { in: 0..1, message: "should be greater than 0 and less than 1" }

  validates_numericality_of :value
  validates_presence_of :user
  validates_presence_of :article
end


