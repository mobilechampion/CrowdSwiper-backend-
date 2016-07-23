# == Schema Information
#
# Table name: users
#
#  id                         :integer          not null, primary key
#  provider                   :string(255)      default("email"), not null
#  uid                        :string(255)      default(""), not null
#  encrypted_password         :string(255)      default(""), not null
#  reset_password_token       :string(255)
#  reset_password_sent_at     :datetime
#  remember_created_at        :datetime
#  sign_in_count              :integer          default(0), not null
#  current_sign_in_at         :datetime
#  last_sign_in_at            :datetime
#  current_sign_in_ip         :string(255)
#  last_sign_in_ip            :string(255)
#  confirmation_token         :string(255)
#  confirmed_at               :datetime
#  confirmation_sent_at       :datetime
#  unconfirmed_email          :string(255)
#  name                       :string(255)
#  nickname                   :string(255)
#  image                      :string(255)
#  email                      :string(255)
#  tokens                     :text(65535)
#  created_at                 :datetime
#  updated_at                 :datetime
#  total_submit_articles      :integer          default(0)
#  total_homepage_articles    :integer          default(0)
#  total_removed_articles     :integer          default(0)
#  total_sent_invitations     :integer          default(0)
#  total_register_invitations :integer          default(0)
#  total_days_as_member       :integer          default(0)
#  birthday                   :datetime
#  political_persuasion       :integer
#
# Indexes
#
#  index_users_on_email                 (email)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#

class User < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

          # :confirmable, :omniauthable, :omniauth_providers => [:facebook, :twitter, :google]
  include DeviseTokenAuth::Concerns::User

  has_many :articles
  has_many :votes
  has_many :favorites

  enum political_persuasion: [ :democrat, :independent, :libertarian, :republican, :other ]

  def self.find_or_create_from_omniauth(auth, provider)
    user_email = auth["email"] ? auth["email"] : "#{auth["id"]}@facebook.com"
    user = User.where(uid: user_email).first
    unless user
      user = User.create(
                email: user_email,
                uid: user_email,
                name: auth["name"],
                image: provider == :facebook ? auth["picture"]["data"]["url"] : auth["picture"],
                provider: provider,
                password: Devise.friendly_token[0,20]
            )
    else
      user.update(image: (provider == :facebook ? auth["picture"]["data"]["url"] : auth["picture"]))
    end

    user
  end

  def gen_auth_header

    # create client id and token
    client_id = SecureRandom.urlsafe_base64(nil, false)
    token     = SecureRandom.urlsafe_base64(nil, false)

    # store client + token in user's token hash
    self.tokens[client_id] = {
        token: BCrypt::Password.create(token),
        expiry: (Time.now + DeviseTokenAuth.token_lifespan).to_i
    }

    build_auth_header(token, client_id)
  end
end
