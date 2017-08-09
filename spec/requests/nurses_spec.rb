require 'rails_helper'

describe 'Nurses requests', type: :request do

  let!(:nurses) { create_list(:nurse, 10) }

  describe 'GET /nurses' do

    before :each {
      get '/nurses'
    }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns all nurses in database' do
      expect(JSON.parse(response.body).size).to eq(10)
    end
  end
end
