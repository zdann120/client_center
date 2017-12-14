FactoryGirl.define do
  factory :action_item do
    actor nil
    description "MyText"
    urgent false
    completed false
  end
  factory :email do
    emailable nil
    token ""
    data ""
  end
  factory :appointment do
    token ""
    description "MyString"
    starts_at "2017-12-12 18:54:10"
    duration_minutes 1
    state 1
    kind "MyString"
  end
  factory :document do
    account nil
    asset "MyString"
  end
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
  factory :admin do
    code "MyString"
    title "MyString"
    active false
    default_user_id 1
  end
end
