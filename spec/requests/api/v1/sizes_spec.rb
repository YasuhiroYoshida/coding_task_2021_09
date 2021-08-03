# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Sizes', type: :request do
  describe 'GET /convert' do
    context 'when params are valid' do
      context 'and a matching size exists in the target locale' do
        it 'returns the matching size' do
          params = {
            size: {
              starting_locale: 'UK',
              starting_locale_size: '22',
              target_locale: 'US'
            }
          }
          get api_v1_sizes_convert_path, params: params

          expect(response).to have_http_status(200)
          expect(JSON.parse(response.body)).to eq({ 'target_locale_size' => '18' })
        end
      end

      context 'but a matching size does not exist in the target locale' do
        it 'returns N/A' do
          params = {
            size: {
              starting_locale: 'UK',
              starting_locale_size: '99',
              target_locale: 'US'
            }
          }
          get api_v1_sizes_convert_path, params: params

          expect(response).to have_http_status(200)
          expect(JSON.parse(response.body)).to eq({ 'target_locale_size' => 'N/A' })
        end
      end
    end
  end

  context 'when params are invalid' do
    it 'returns error messages' do
      params = {
        size: {
          starting_locale: 'UK',
          starting_locale_size: '',
          target_locale: 'US'
        }
      }
      get api_v1_sizes_convert_path, params: params

      expect(response).to have_http_status(422)
      expect(JSON.parse(response.body)).to eq({ 'messages' => ["Starting locale size can't be blank",
                                                               'Starting locale size is not a number'] })
    end
  end
end
