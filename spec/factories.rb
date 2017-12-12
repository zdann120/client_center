FactoryGirl.define do
  factory :ledger_item do
    ledger nil
    description "MyString"
    quantity 1
    unit_of_measure "MyString"
    unit_price_cents 1
  end
  factory :ledger do
    type ""
    reference_code ""
    account nil
  end
  factory :contact do
    contactable nil
    first_name "MyString"
    last_name "MyString"
    business_name "MyString"
    address_line_1 "MyString"
    address_line_2 "MyString"
    city "MyString"
    state "MyString"
    zip_code "MyString"
    country "MyString"
    primary_phone "MyString"
    alternate_phone "MyString"
    linking_code ""
  end
  factory :user do
    
  end
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
