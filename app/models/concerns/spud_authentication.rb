module Concerns
    module SpudAuthentication
        extend ActiveSupport::Concern
        included do
            acts_as_authentic do |c|
                c.crypto_provider = Authlogic::CryptoProviders::Sha512
                # c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
            end # block optional
        end
    end
end
