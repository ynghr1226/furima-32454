FactoryBot.define do
  factory :item do
    name                 { '商品名' }
    introduction         { '商品説明' }
    category_id          { 2 }
    condition_id         { 2 }
    delivery_fee_id      { 2 }
    prefecture_id        { 2 }
    ship_date_id         { 2 }
    price                { 500 }
    user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.jpg'), filename: 'test_image.jpg', content_type: 'image/jpg')
    end
  end
end
