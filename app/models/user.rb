class User < ApplicationRecord
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password
    attr_accessor :resp
    
    def mood
        if happiness.present? 
            happiness >= nausea ? "happy" : "sad"
        end
    end

    
    
end
