# frozen_string_literal: true

require 'rails_helper'

describe 'Contacts', type: :request do
  describe 'POST /contacts' do
    let(:email) { Faker::Internet.unique.email }
    let(:first_name) { Faker::Books::Dune.character }
    let(:last_name) { Faker::Books::Dune.character }
    let(:phone) { Faker::PhoneNumber.cell_phone_in_e164 }

    context 'when the request is valid' do
      let(:contact) do
        {
            'contact' => {
                :email => email,
                :first_name => first_name,
                :last_name => last_name,
                :phone => phone
            }
        }
      end

      before { post '/contacts', params: contact }

      it 'creates a new contact' do
        expect(json['email']).to eq email
        expect(json['first_name']).to eq first_name
        expect(json['last_name']).to eq last_name
        expect(json['phone']).to eq phone
      end

      it { expect(response).to have_http_status :created }
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) do
        {
            'contact' => {
                :email => email,
                :first_name => first_name,
                :last_name => last_name,
            }
        }
      end

      before { post '/contacts', params: invalid_attributes }

      it 'returns status :unprocessable_entity (422)' do
        expect(response).to have_http_status :unprocessable_entity
        expect(response.body).to match(/failed: Phone can't be blank/)
      end
    end

    context 'when the email already exists' do
      let(:invalid_attributes) do
        {
            'contact' => {
                :email => email,
                :first_name => first_name,
                :last_name => last_name,
                :phone => phone
            }
        }
      end

      before do
        create(:contact, email: email)
        post '/contacts', params: invalid_attributes
      end

      it 'returns status :unprocessable_entity (422)' do
        expect(response).to have_http_status :unprocessable_entity
        expect(response.body).to match(/Email has already been taken/)
      end
    end
  end

  describe 'GET /contacts/:id' do
    context 'when the record does not exist' do
      before { get '/contacts/1000' }

      it 'returns status :not_found (404)' do
        expect(response).to have_http_status :not_found
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Contact/)
      end
    end

    context 'when the record exists' do
      let(:contact) { create(:contact) }

      before { get "/contacts/#{contact.id}" }

      it 'returns the contact' do
        expect(json).not_to be_empty
        expect(json['id']).to eq contact.id
      end

      it 'returns status :ok (200)' do
        expect(response).to have_http_status :ok
      end
    end
  end

  describe 'PUT /contacts/:id' do
    context 'when the record does not exist' do
      before { put '/contacts/1000' }

      it 'returns status :not_found (404)' do
        expect(response).to have_http_status :not_found
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Contact/)
      end
    end

    context 'when the record exists' do
      let(:email) { Faker::Internet.unique.email }
      let(:contact) { create(:contact) }
      let(:valid_attributes) do
        {
            'contact' => {
                :email => email
            }
        }
      end

      before { put "/contacts/#{contact.id}", params: valid_attributes }

      it 'updates the contact' do
        contact.reload
        expect(contact.email).to eq email
      end

      it 'returns status :ok (200)' do
        expect(response).to have_http_status :ok
      end
    end
  end

  describe 'DELETE /contacts/:id' do
    context 'when the record does not exist' do
      before { delete '/contacts/1000' }

      it 'returns status :not_found (404)' do
        expect(response).to have_http_status :not_found
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Contact/)
      end
    end

    context 'when the record exists' do
      let(:contact) { create(:contact) }
      before { delete "/contacts/#{contact.id}" }

      it 'delete the contact' do
        expect(Contact::all).to be_empty

      end

      it 'returns status :no_content (204)' do
        expect(response).to have_http_status :no_content
      end
    end
  end

  describe 'GET /contacts' do

    context 'when the records exists' do
      before { get "/contacts" }

      it 'returns status :ok (200)' do
        expect(response).to have_http_status :ok
      end
    end
  end

end
