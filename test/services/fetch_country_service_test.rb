require 'test_helper'

class FetchCountryServiceTest < ActiveSupport::TestCase
  test "it should return 'CA' for a valid IP" do
    ip = '24.48.0.1'
    # falsifying petition response
    stub_request(:get, "http://ip-api.com/json/#{ip}").
      to_return(status: 200, body: {
        status: 'success',
        countryCode: 'CA'
      }.to_json, headers: {})

    assert_equal(FetchCountryService.new(ip).perform, 'ca')
  end

  test "it should return 'nil' for an invalid IP" do
    # falsifying petition response
    stub_request(:get, "http://ip-api.com/json/fakeIp").
      to_return(status: 200, body: {
        status: 'fail'
      }.to_json, headers: {})

    assert_nil(FetchCountryService.new('fakeIp').perform)
  end
end