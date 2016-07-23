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

class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:fb_oauth, :google_oauth]

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.json { render json: { status: "success", data: { user: @user } }, status: :ok }
    end

  end

  def fb_oauth
    @graph = Koala::Facebook::API.new(params[:access_token])

    profile = @graph.get_object("me?fields=name,picture,email")

    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_or_create_from_omniauth(profile, :facebook)

    create_response_for_oauth(@user)
  end

  def google_oauth
    return render status: :forbidden unless params[:access_token]

    access_token = params[:access_token]
    response = HTTParty.get("https://www.googleapis.com/oauth2/v2/userinfo",
                            headers: {"Access_token"  => access_token,
                                      "Authorization" => "OAuth #{access_token}"})

    if response.code == 200
      data = JSON.parse(response.body)
      @user = User.find_or_create_from_omniauth(data, :google_auth2)
    end

    create_response_for_oauth(@user)
  end

  private

  def create_response_for_oauth(user)
    if user.persisted?

      # generate auth headers for response
      new_auth_header = user.gen_auth_header

      # update response with the header that will be required by the next request
      response.headers.merge!(new_auth_header)

      sign_in user

      respond_to do |format|
        format.json { render json: { data: { user: user }, status: "success" }, status: :ok }
      end
    else
      respond_to do |format|
        format.json { render json: { status: "error", errors: custom_errors(@user) }, status: 403 }
      end
    end
  end
end
