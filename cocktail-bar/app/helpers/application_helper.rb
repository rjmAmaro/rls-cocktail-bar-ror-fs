# frozen_string_literal: true

module ApplicationHelper
  def url_valid?(url)
    true if url =~ /\A#{URI::DEFAULT_PARSER.make_regexp}\z/
    false
  end
end
