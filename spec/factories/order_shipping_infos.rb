FactoryBot.define do
  factory :order_shipping_info do
    postal_code { '123-4567'}
    prefecture_id { 2 }
    municipality { '東京都' }
    address { '1-1' }
    building { 'メゾン' }
    phone_num { '12345678909'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
