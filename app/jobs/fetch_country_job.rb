class FetchCountryJob < ApplicationJob
  queue_as :default

  def perform(user_id, ip_address)
    country = FetchCountryService.new(ip_address).perform
    user = User.find(user_id)
    if country.present?
      user.update(country: country)
    end
  end
end
