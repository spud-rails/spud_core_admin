FactoryGirl.define do
  sequence :first_name do |n|
    "John#{n}"
  end
  
  sequence :last_name do |n|
    "Doe#{n}"
  end
  
  sequence :login do |n|
    "john#{n}doe#{n}"
  end
  
  sequence :email do |n|
    "john#{n}doe#{n}@email.com"
  end
  
  sequence :single_access_token do |n|
    "k3cF#{n}"
  end
    
  factory :spud_user do
    first_name { Factory.next(:first_name) }
    last_name { Factory.next(:last_name) }
    login { Factory.next(:login) }
    email { Factory.next(:email) }
    password "password"
    password_confirmation "password"
    single_access_token { Factory.next(:single_access_token) }
  end
end