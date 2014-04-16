require 'active_record/instrument/version'
require 'new_relic/agent/method_tracer'


module ActiveRecord
  module Instrument
    class Railtie < Rails::Railtie
      initializer 'activerecord-instrument.inject_method_tracers', after: 'newrelic_rpm.start_plugin' do |app|
        # this is where the magic happens, boys
        ActiveRecord::ConnectionAdapters::AbstractAdapter.class_eval do
          include ::NewRelic::Agent::MethodTracer
          add_method_tracer :initialize
          add_method_tracer :reconnect!
          add_method_tracer :disconnect!
          add_method_tracer :reset!
        end

        module ActiveRecord
          module ConnectionHandling
            extend ::NewRelic::Agent::MethodTracer
            add_method_tracer :establish_connection
            add_method_tracer :mysql2_connection
          end
        end
      end
    end
  end
end
