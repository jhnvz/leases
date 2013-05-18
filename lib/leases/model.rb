require 'leases/model/base'
require 'leases/model/callbacks'

module Leases
  module Model

    extend ActiveSupport::Concern

    module ClassMethods

      def leases(options={})
        include Base
        include Callbacks
        setup_lease(options)
      end

    end

  end
end

ActiveRecord::Base.send(:include, Leases::Model)
