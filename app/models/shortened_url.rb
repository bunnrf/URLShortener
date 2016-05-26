class ShortenedUrl < ActiveRecord::Base
  validates :user_id, presence: true

  belongs_to(
    :submitter,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :visits,
    class_name: "Visit",
    foreign_key: :short_url_id,
    primary_key: :id
  )

  has_many(
    :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :visitor
  )

  def self.random_code
    short_code = SecureRandom::urlsafe_base64
    until !ShortenedUrl.exists?(:short_url => short_code)
      short_code = SecureRandom::urlsafe_base64
    end
    short_code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    code = ShortenedUrl.random_code
    ShortenedUrl.create(long_url: long_url, short_url: code, user_id: user.id)
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques
    visitors.where(updated_at: ((Time.now - 10.minutes)..Time.now)).count

    #Visit.select(:user_id).distinct.where(updated_at: ((Time.now - 10.minutes)..Time.now)).count

    # num_uniques = Visit.select(:user_id).distinct.where("short_url_id == ?", self.id)
    # num_uniques.where({ short_url_id: "self.id", updated_at: ((Time.now - 10.minutes)..Time.now) }).count

    #Visit.select(:user_id).distinct.where({ short_url_id: "self.id", updated_at: ((Time.now - 10.minutes)..Time.now) }).count
  end

end
