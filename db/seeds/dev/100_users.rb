# frozen_string_literal: true

USERS = [
  name: "admin",  email: "admin@google.com",  password: "password", role: "admin"
]

ActiveRecord::Base.transaction do
  USERS.each do |attrs|
    user = Users::User.find_by(name: attrs[:name])

    next unless user.nil?

    user = Users::Users.create!(attrs)
  end
end