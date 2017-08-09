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

  describe 'POST /nurses' do

    let(:role) { create(:role, name: "nurse") }

    let(:valid_attributes) { {
      first_name: 'Firstname',
      last_name: 'Secondname',
      email: 'test@test.com',
      role: "nurse"
    } }

    context 'when the request is valid' do
      before { post '/nurses', params: valid_attributes }

      it 'creates a nurse' do
        expect(JSON.parse(response.body)['first_name']).to eq('Firstname')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do

      before { post '/nurses', params: { email: 'test@test.com', role: role } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: First name can't be blank, Last name can't be blank/)
      end
    end
  end

end
