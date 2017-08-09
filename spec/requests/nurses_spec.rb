require 'rails_helper'

describe 'Nurses requests', type: :request do

  let!(:nurses) { create_list(:nurse, 10) }

  describe 'GET /nurses' do

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

  describe 'GET /nurses/:id' do

    before {
      get "/nurses/#{nurse_id}"
    }

    context 'when the record exists' do
      let(:nurse_id) { nurses.last.id }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the nurse' do
        expect(JSON.parse(response.body)['id']).to eq(nurse_id)
      end
    end

    context 'when the record does not exist' do

      let(:nurse_id) { 50 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Nurse with 'id'=/)
      end
    end
  end
end
