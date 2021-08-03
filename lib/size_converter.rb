#! /usr/bin/env ruby
#
# Task #2-1 - Create a rails app using the program in Task 1
# One way to check this is to spin up this rails app
# and access localhost:3000 on browser as usual.
# And enter "Starting locale" "Size" "Target locale" and click "Convert."
#
# Task #2-2 - Create an API using the program in Task 1
# One way to check this is to spin up this rails app
# and access localhost:3000/sizes/convert using tools like curl or Postman.
# Parameters have to be manually specified in this manner:
# {
#   "size": {
#     "starting_locale": "UK",
#     "starting_locale_size": "22",
#     "target_locale": "US"
#   }
# }
#
require "matrix"

module SizeConverter
  def self.included(base)
    base.class_eval do
      attr_accessor :starting_locale, :starting_locale_size, :target_locale, :target_locale_size
    end
  end

  UK_SIZES    = %w[2 4 6 8 10 12 14 16 18 20 22 24 26].freeze
  US_SIZES    = %w[0 0 2 4 6 8 10 12 14 16 18 20 22].freeze
  FR_SIZES    = %w[30 32 34 36 38 40 42 44 46 48 50 52 54].freeze
  IT_SIZES    = %w[34 36 38 40 42 44 46 48 50 52 54 56 58].freeze
  JA_SIZES    = %w[1 3 5 7 9 11 13 15 17 19 21 23 25].freeze
  AU_SIZES    = %w[2 4 6 8 10 12 14 16 18 20 22 24 26].freeze
  ALPHA_SIZES = %w[N/A XXXS XXS XS S M L XL XXL XXXL N/A N/A N/A].freeze
  LOCALES     = %w[UK US FR IT JA AU ALPHA].freeze

  def find_target_locale_size(starting_locale, starting_size, target_locale)
    vetical_index = LOCALES.index(target_locale)
    horizontal_index = sizes(starting_locale).index(starting_size)

    if vetical_index && horizontal_index
      matrix[vetical_index, horizontal_index]
    else
      "N/A"
    end
  end

  private def sizes(locale)
    case locale
    when "UK" then UK_SIZES
    when "US" then US_SIZES
    when "FR" then FR_SIZES
    when "IT" then IT_SIZES
    when "JA" then JA_SIZES
    when "AU" then AU_SIZES
    when "ALPHA" then ALPHA_SIZES
    else; []
    end
  end

  private def matrix
    Matrix[UK_SIZES, US_SIZES, FR_SIZES, IT_SIZES, JA_SIZES, AU_SIZES, ALPHA_SIZES]
  end

  module_function :find_target_locale_size, :sizes, :matrix
end
