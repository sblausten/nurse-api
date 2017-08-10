require 'rails_helper'

describe 'Nurses requests', type: :request do

  let!(:nurses) { create_list(:nurse, 10) }

  describe 'GET /api/nurses' do

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

  describe 'POST /api/nurses' do

    let(:role) { create(:role, name: "nurse") }

    let(:valid_attributes) { {
      first_name: 'First',
      last_name: 'last',
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
      before {
        post '/api/nurses', params: {
          email: 'test@test.com',
          role: 'nurse' }
      }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: First name can't be blank, Last name can't be blank/)
      end
    end
  end

  describe 'PUT /api/nurses/:id' do

    context 'when the record exists' do
      let(:nurse_id) { '2' }
      let(:valid_attributes) { {
        email: 'updated@test.com',
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

  describe 'DELETE /api/nurses/:id' do

    let(:nurse_id) { 2 }

    it 'returns status code 204' do
      delete "/api/nurses/#{nurse_id}"
      expect(response).to have_http_status(204)
    end

  end
end
