module Searchable
  extend ActiveSupport::Concern

  module ClassMethods
    def searchable(searching_params)
      results = self.where(nil)
      searching_params.each do |key, value|
        results = results.public_send("search_by_#{key}", value) if value.present?
      end
      results
    end
  end
end