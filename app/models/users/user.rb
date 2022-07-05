# frozen_string_literal: true

module Users

  class User < ApplicationRecord
    def self.admins
      where(role: 'admin')
    end
  end
end
