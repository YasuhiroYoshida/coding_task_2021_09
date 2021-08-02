# frozen_string_literal: true

module Api
  module V1
    class SizesController < ApplicationController
      attr_reader :size

      before_action :buid, :validate, only: [:convert]

      def convert
        size.update_target_locale_size
        if size.valid?
          render_success
        else
          render_error
        end
      end

      private

      def sizes_params
        params.require(:size).permit(:starting_locale, :starting_locale_size, :target_locale)
      end

      def buid
        @size = Size.new(starting_locale: sizes_params[:starting_locale],
                         starting_locale_size: sizes_params[:starting_locale_size],
                         target_locale: sizes_params[:target_locale])
      end

      def validate
        return if size.valid?

        render_error and return
      end

      def render_success
        render json: { target_locale_size: size.target_locale_size }, status: :ok
      end

      def render_error
        render json: { messages: size.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
end
