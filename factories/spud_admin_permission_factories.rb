FactoryGirl.define do
  sequence :permission_name do |n|
    "app#{n}"
  end
  
  factory :spud_admin_permission do
    name { Factory.next(:permission_name) }
    access true
  end
end
