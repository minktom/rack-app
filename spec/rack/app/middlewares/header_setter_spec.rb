require 'spec_helper'
describe Rack::App do

  include Rack::App::Test

  describe '.headers' do

    rack_app described_class do

      headers 'Access-Control-Allow-Origin' => '*',
              'Access-Control-Expose-Headers' => 'X-My-Custom-Header, X-Another-Custom-Header',
              ::Rack::CONTENT_TYPE => 'application/json'

      get '/' do
        '{}'
      end

    end

    it { expect(get(:url => '/').headers[::Rack::CONTENT_TYPE]).to eq 'application/json' }

    it { expect(get(:url => '/').headers['Access-Control-Allow-Origin']).to eq '*' }

    it { expect(get(:url => '/').headers['Access-Control-Expose-Headers']).to eq 'X-My-Custom-Header, X-Another-Custom-Header' }

  end

end