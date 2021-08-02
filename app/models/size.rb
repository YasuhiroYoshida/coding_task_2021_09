# frozen_string_literal: true

require 'matrix'
require 'size_converter'

class Size
  include SizeConverter
  include ActiveModel::Validations

  validates :starting_locale_size, presence: true, numericality: { only_integer: true }

  def initialize(starting_locale: nil, starting_locale_size: nil, target_locale: nil)
    self.starting_locale = starting_locale
    self.starting_locale_size = starting_locale_size
    self.target_locale = target_locale
  end

  def update_target_locale_size
    self.target_locale_size = find_target_locale_size(starting_locale, starting_locale_size, target_locale)
  end
end
