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

module ArticlesHelper
end
