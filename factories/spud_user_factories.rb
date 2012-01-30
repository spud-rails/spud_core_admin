FactoryGirl.define do
  sequence :first_name do |n|
    "John#{n}"
  end
  
  sequence :last_name do |n|
    "Doe#{n}"
  end
  
  sequence :login do |n|
    "john#{n}doe#{n}@email.com"
  end
    
  factory :spud_user do
    first_name { Factory.next(:first_name) }
    last_name { Factory.next(:last_name) }
    login { Factory.next(:login) }
  end
end