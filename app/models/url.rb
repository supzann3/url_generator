class Url < ActiveRecord::Base
  before_save :set_url_safe
  validates_presence_of :original

  validate do |url|
    if !(url.original).match(URI::regexp(%w(http https)))
      errors.add(:url, "The url you have entered is invalid. Please re-enter with the same format as http://example.com")
    end
  end

  def set_url_safe
    self.url_safe = SecureRandom.urlsafe_base64(5)
  end

end
