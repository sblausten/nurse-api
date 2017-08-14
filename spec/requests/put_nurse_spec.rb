require 'rails_helper'

describe 'PUT /api/nurses/:id', type: :request do

  let!(:nurses) { create_list(:nurse, 10) }

  context 'when the record exists' do
    let(:nurse_id) { '2' }
    let(:valid_attributes) { {
      email: 'updated@test.com'
    } }

    before {
      put "/api/nurses/#{nurse_id}", params: valid_attributes
    }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'updates the record' do
      expect(response.body).to be_empty
    end
  end
end

describe 'PUT /api/nurses/:first_name/:last_name' do

  let!(:nurses) { create_list(:nurse, 10) }

  context 'when the record exists' do
    let(:first_name) { "firstname" }
    let(:last_name) { "secondname" }
    let(:valid_attributes) { {
      email: 'updated@test.com',
    } }

    before {
      put "/api/nurses/#{first_name}/#{last_name}", params: valid_attributes
    }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'updates the record' do
      expect(response.body).to be_empty
    end
  end

end
