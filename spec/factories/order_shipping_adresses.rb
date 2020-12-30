FactoryBot.define do
  factory :order_shipping_adress do
    postcode       { '111-1111' }
    prefecture_id  { 3 }
    city           { '中野区' }
    block          { '中野' }
    building       { 'プラウドフラット' }
    phone_number   { '09011112222' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
