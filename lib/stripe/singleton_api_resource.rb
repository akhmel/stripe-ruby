# frozen_string_literal: true

module Stripe
  class SingletonAPIResource < APIResource
    def self.resource_url
      if self == SingletonAPIResource
        raise NotImplementedError, "SingletonAPIResource is an abstract class.  You should perform actions on its subclasses (Account, etc.)"
      end
      "/v1/#{CGI.escape(class_name.downcase)}"
    end

    def resource_url
      self.class.resource_url
    end

    def self.retrieve(opts = {})
      instance = new(nil, Util.normalize_opts(opts))
      instance.refresh
      instance
    end
  end
end
