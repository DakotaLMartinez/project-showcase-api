class ProjectSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :about, :live_demo_url, :code_url, :video_url, :technologies, :collaborators, :user_id

  attribute :featured_image_url do |project|
    Rails.application.routes.url_helpers.rails_blob_url(project.featured_image) if project.featured_image.attached?
  end
end
