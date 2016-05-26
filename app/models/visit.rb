class Visit < ActiveRecord::Base
  validates :user_id, presence: true
  validates :short_url_id, presence: true

  belongs_to(
    :visitor,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :visited_url,
    class_name: "ShortenedUrl",
    foreign_key: :short_url_id,
    primary_key: :id
  )

  def self.record_visit!(user, shortened_url)
    Visit.create(short_url_id: shortened_url.id, user_id: user.id)
  end
end
