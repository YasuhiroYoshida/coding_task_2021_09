# frozen_string_literal: true

class SizesController < ApplicationController
  attr_reader :size

  before_action :buid, :validate, only: [:convert]

  def new
    @size = Size.new
  end

  def convert
    size.update_target_locale_size
    render :new
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

    render :new and return
  end
end
