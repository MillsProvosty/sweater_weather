FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_email_#{n}" }
    password { 'password' }
  end
end
