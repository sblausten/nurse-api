require 'rails_helper'

describe 'POST /api/nurses' do

  let!(:nurses) { create_list(:nurse, 10) }

  let(:role) { create(:role, name: "nurse") }

  let(:valid_attributes) { {
    first_name: 'First',
    last_name: 'last',
    email: 'test@test.com',
    role: "nurse"
  } }

  let(:invalid_attributes) { {
    email: 'test@test.com',
    role: "nurse"
  } }

  context 'when the request is valid' do
    before { post '/api/nurses', params: valid_attributes }

    it 'creates a nurse' do
      expect(JSON.parse(response.body)['first_name']).to eq('first')
    end

    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end
  end

  context 'when the request is invalid' do
    before { post '/api/nurses', params: invalid_attributes }

    it 'returns status code 422' do
      expect(response).to have_http_status(422)
    end

    it 'returns a validation failure message' do
      expect(response.body)
        .to match(/Validation failed: First name can't be blank, Last name can't be blank/)
    end
  end
end
