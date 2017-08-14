require 'rails_helper'

describe 'DELETE /api/nurses/:id', type: :request do

  let!(:nurses) { create_list(:nurse, 10) }

  let(:nurse_id) { 2 }

  it 'returns status code 204' do
    delete "/api/nurses/#{nurse_id}"
    expect(response).to have_http_status(204)
  end
end
