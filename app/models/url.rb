class Url < ActiveRecord::Base
  before_save :set_url_safe
  validates_presence_of :original

  validate do |url|
    if !(url.original).match(URI::regexp(%w(http https)))
      errors.add(:url, "The url you have enter is invalid. Please enter for example http://example.com")
    end
  end

  def set_url_safe
    self.url_safe = SecureRandom.urlsafe_base64(5)
  end

end
