require "matrix"
require "size_converter"

class Size
  include SizeConverter
  include ActiveModel::Validations

  validates :starting_locale_size, format: {
    with: /\A([0-9]{1,2}|XXXS|XXS|XS|S|M|L|XL|XXL|XXXL)\z/,
    message: "must be a one or two-digit number, XXXS, XXS, XS, S, M, L, XL, XXL, and XXXL"
  }

  def initialize(starting_locale: nil, starting_locale_size: nil, target_locale: nil)
    self.starting_locale = starting_locale
    self.starting_locale_size = starting_locale_size
    self.target_locale = target_locale
  end

  def update_target_locale_size
    self.target_locale_size = find_target_locale_size(starting_locale, starting_locale_size, target_locale)
  end
end
