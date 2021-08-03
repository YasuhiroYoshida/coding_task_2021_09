require "rails_helper"

RSpec.describe "Sizes", type: :request do
  describe "GET /convert" do
    context "when params are valid" do
      context "and a matching size exists in the target locale" do
        let(:params) do
          {
            size: {
              starting_locale: "UK",
              starting_locale_size: "22",
              target_locale: "US"
            }
          }
        end
        let(:expected_size) do
          Size.new.tap do |s|
            s.starting_locale = params[:size][:starting_locale]
            s.starting_locale_size = params[:size][:starting_locale_size]
            s.target_locale = params[:size][:target_locale]
            s.target_locale_size = "18"
          end
        end

        it "returns the matching size" do
          get sizes_convert_path, params: params

          expect(response).to have_http_status(200)
          expect(assigns(:size).starting_locale).to eq(expected_size.starting_locale)
          expect(assigns(:size).starting_locale_size).to eq(expected_size.starting_locale_size)
          expect(assigns(:size).target_locale).to eq(expected_size.target_locale)
          expect(assigns(:size).target_locale_size).to eq(expected_size.target_locale_size)
          expect(assigns(:size).errors.full_messages).to eq([])
        end
      end

      context "but a matching size does not exist in the target locale" do
        let(:params) do
          {
            size: {
              starting_locale: "UK",
              starting_locale_size: "99",
              target_locale: "US"
            }
          }
        end
        let(:expected_size) do
          Size.new.tap do |s|
            s.starting_locale = params[:size][:starting_locale]
            s.starting_locale_size = params[:size][:starting_locale_size]
            s.target_locale = params[:size][:target_locale]
            s.target_locale_size = "N/A"
          end
        end

        it "returns N/A" do
          get api_v1_sizes_convert_path, params: params

          expect(response).to have_http_status(200)
          expect(assigns(:size).starting_locale).to eq(expected_size.starting_locale)
          expect(assigns(:size).starting_locale_size).to eq(expected_size.starting_locale_size)
          expect(assigns(:size).target_locale).to eq(expected_size.target_locale)
          expect(assigns(:size).target_locale_size).to eq(expected_size.target_locale_size)
          expect(assigns(:size).errors.full_messages).to eq([])
        end
      end
    end

    context "when params are invalid" do
      context "with starting_locale_size blank" do
        let(:params) do
          {
            size: {
              starting_locale: "UK",
              starting_locale_size: "",
              target_locale: "US"
            }
          }
        end
        let(:expected_size) do
          Size.new.tap do |s|
            s.starting_locale = params[:size][:starting_locale]
            s.starting_locale_size = params[:size][:starting_locale_size]
            s.target_locale = params[:size][:target_locale]
            s.target_locale_size = nil
          end
        end

        it "returns error messages without any value set to target_locale_size" do
          get api_v1_sizes_convert_path, params: params

          expect(response).to have_http_status(422)
          expect(assigns(:size).starting_locale).to eq(expected_size.starting_locale)
          expect(assigns(:size).starting_locale_size).to eq(expected_size.starting_locale_size)
          expect(assigns(:size).target_locale).to eq(expected_size.target_locale)
          expect(assigns(:size).target_locale_size).to eq(expected_size.target_locale_size)
          expect(assigns(:size).errors.full_messages)
            .to eq(["Starting locale size must be a one or two-digit number, XXXS, XXS, XS, S, M, L, XL, XXL, and XXXL"])
        end
      end

      context "with starting_locale_size not in use" do
        let(:params) do
          {
            size: {
              starting_locale: "UK",
              starting_locale_size: "XXXXL",
              target_locale: "US"
            }
          }
        end
        let(:expected_size) do
          Size.new.tap do |s|
            s.starting_locale = params[:size][:starting_locale]
            s.starting_locale_size = params[:size][:starting_locale_size]
            s.target_locale = params[:size][:target_locale]
            s.target_locale_size = nil
          end
        end

        it "returns error messages without any value set to target_locale_size" do
          get api_v1_sizes_convert_path, params: params

          expect(response).to have_http_status(422)
          expect(assigns(:size).starting_locale).to eq(expected_size.starting_locale)
          expect(assigns(:size).starting_locale_size).to eq(expected_size.starting_locale_size)
          expect(assigns(:size).target_locale).to eq(expected_size.target_locale)
          expect(assigns(:size).target_locale_size).to eq(expected_size.target_locale_size)
          expect(assigns(:size).errors.full_messages)
            .to eq(["Starting locale size must be a one or two-digit number, XXXS, XXS, XS, S, M, L, XL, XXL, and XXXL"])
        end
      end
    end
  end
end
