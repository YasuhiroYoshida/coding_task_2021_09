#! /usr/bin/env ruby
# frozen_string_literal: true
#
# Task #3 - Write some standalone ruby coderuby code using the API from Task #2
# One way to check this is to get on CLI and run a command like the following:
#   ruby ./size_converter_client.rb "UK" "22" "US"
#
require 'uri'
require 'net/http'

def find_target_locale_size(argv)
  params = "?size[starting_locale]=#{argv[0]}&size[starting_locale_size]=#{argv[1]}&size[target_locale]=#{argv[2]}"
  uri = URI("http://localhost:3000/api/v1/sizes/convert#{params}")

  puts Net::HTTP.get_response(uri).body
end

find_target_locale_size(ARGV)
