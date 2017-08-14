require 'rails_helper'

describe 'GET /api/nurses', type: :request do
  let!(:nurses) { create_list(:nurse, 10) }

  before :each {
    get nurses_path
  }

  it 'returns status code 200' do
    expect(response).to have_http_status(200)
  end

  it 'returns all nurses in database' do
    expect(JSON.parse(response.body).size).to eq(10)
  end
end
