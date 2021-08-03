# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Sizes', type: :request do
  describe 'GET /convert' do
    context 'when params are valid' do
      context 'and a matching size exists in the target locale' do
        let(:params) do
          {
            size: {
              starting_locale: 'UK',
              starting_locale_size: '22',
              target_locale: 'US'
            }
          }
        end

        it 'returns the matching size' do
          get api_v1_sizes_convert_path, params: params

          expect(response).to have_http_status(200)
          expect(JSON.parse(response.body)).to eq({ 'target_locale_size' => '18' })
        end
      end

      context 'but a matching size does not exist in the target locale' do
        let(:params) do
          {
            size: {
              starting_locale: 'UK',
              starting_locale_size: '99',
              target_locale: 'US'
            }
          }
        end

        it 'returns N/A' do
          get api_v1_sizes_convert_path, params: params

          expect(response).to have_http_status(200)
          expect(JSON.parse(response.body)).to eq({ 'target_locale_size' => 'N/A' })
        end
      end
    end

    context 'when params are invalid' do
      context 'with starting_locale_size blank' do
        let(:params) do
          {
            size: {
              starting_locale: 'UK',
              starting_locale_size: '',
              target_locale: 'US'
            }
          }
        end

        it 'returns error messages' do
          get api_v1_sizes_convert_path, params: params

          expect(response).to have_http_status(422)
          expect(JSON.parse(response.body)).to eq({ 'messages' => ['Starting locale size must be a one or two-digit number, XXXS, XXS, XS, S, M, L, XL, XXL, and XXXL'] })
        end
      end


      context 'with starting_locale_size not in use' do
        let(:params) do
          {
            size: {
              starting_locale: 'UK',
              starting_locale_size: 'XXXXL',
              target_locale: 'US'
            }
          }
        end

        it 'returns error messages' do
          get api_v1_sizes_convert_path, params: params

          expect(response).to have_http_status(422)
          expect(JSON.parse(response.body)).to eq({ 'messages' => ['Starting locale size must be a one or two-digit number, XXXS, XXS, XS, S, M, L, XL, XXL, and XXXL'] })
        end
      end
    end
  end
end
