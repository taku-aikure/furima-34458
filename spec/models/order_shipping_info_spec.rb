require 'rails_helper'

RSpec.describe OrderShippingInfo, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping_info = FactoryBot.build(:order_shipping_info, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '購入ができるとき' do
      
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@order_shipping_info).to be_valid
      end

      it 'buildingが空でも購入できること' do
        @order_shipping_info.building = ''
        expect(@order_shipping_info).to be_valid
      end
    end

    context '購入できないとき' do
      
      it 'postal_codeが空では購入できない' do
        @order_shipping_info.postal_code = ''
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'prefecture_idが1では購入できない' do
        @order_shipping_info.prefecture_id = 1
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'municipalityが空では購入できない' do
        @order_shipping_info.municipality = ''
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空では購入できない' do
        @order_shipping_info.address = ''
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numが空では購入できない' do
        @order_shipping_info.phone_num = ''
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Phone num can't be blank")
      end

      it 'tokenが空では購入できない' do
        @order_shipping_info.token = nil
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeは半角ハイフンを含む正しい形式でないと保存できない' do
        @order_shipping_info.postal_code = '1234567'
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Postal code is invalid")
      end

      it 'phone_numは11桁以内でないと保存できない' do
        @order_shipping_info.phone_num = '123456789098'
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Phone num is invalid")
      end
    end

  end


end
