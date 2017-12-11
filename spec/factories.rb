FactoryGirl.define do
  factory :user_account do
    user nil
    account nil
    access_level 1
  end
  factory :account do
    code "MyString"
    title "MyString"
    active false
    default_user_id 1
  end
end
