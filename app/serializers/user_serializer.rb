class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name, :hide_email, :linkedin_url, :github_url, :twitter_url

  attribute :created_date do |user|
    user.created_at && user.created_at.strftime('%m/%d/%Y')
  end

  attribute :avatar_url do |user|
    Rails.application.routes.url_helpers.rails_blob_url(user.avatar) if user.avatar.attached?
  end

  attribute :projects do |user|
    user.projects.map do |project|
      ProjectSerializer.new(project).serializable_hash[:data][:attributes]
    end
  end
  
end
