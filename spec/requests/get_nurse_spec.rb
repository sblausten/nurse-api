require 'rails_helper'

describe 'Nurses requests', type: :request do

  let!(:nurses) { create_list(:nurse, 10) }
  describe 'GET /api/nurses/:id' do

    context 'when the record exists' do
      let(:nurse_id) { nurses.last.id }

      before {
        get "/api/nurses/#{nurse_id}"
      }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the nurse' do
        expect(JSON.parse(response.body)['id']).to eq(nurse_id)
      end
    end

    context 'when the record does not exist' do
      let(:nurse_id) { 101 }

      before {
        get "/api/nurses/#{nurse_id}"
      }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Nurse with 'id'=/)
      end
    end
  end

  describe 'GET /api/nurses/:first_name/:last_name' do

    context 'when the record exists' do
      let(:first_name) { nurses.last.first_name }
      let(:last_name) { nurses.last.last_name }

      before {
        get "/api/nurses/#{first_name}/#{last_name}"
      }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the nurse' do
        expect(JSON.parse(response.body)['first_name']).to eq(first_name)
      end
    end

    context 'when the record does not exist' do
      let(:first_name) { "Notexisting" }
      let(:last_name) { "Notexisting" }

      before {
        get "/api/nurses/#{first_name}/#{last_name}"
      }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Nurse/)
      end
    end
  end
end
