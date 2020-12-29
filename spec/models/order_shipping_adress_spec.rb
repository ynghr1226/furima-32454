require 'rails_helper'

RSpec.describe OrderShippingAdress, type: :model do
  before do
    @order = FactoryBot.build(:order_shipping_adress)
  end

  describe  '商品購入機能' do
    context '商品が購入できる時' do
      it '必須項目を全て正しく入力すれば購入ができる' do
        expect(@order).to be_valid
      end

      it '建物名が空でも登録できる'do
      @order.building = ""
      expect(@order).to be_valid
      end
    end

    context '商品が購入できない時' do
      it '郵便番号が空では登録できない' do
        @order.postcode = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Postcode can't be blank"
      end

      it '郵便番号にハイフンの記載がないと登録できない' do
        @order.postcode = '1112222'
        @order.valid?
        expect(@order.errors.full_messages).to include 'Postcode is invalid. Include hyphen(-)'
      end

      it '都道府県が---では登録できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture can't be blank"
      end

      it '市区町村が空では登録できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "City can't be blank"
      end

      it '番地が空では登録できない' do
        @order.block = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Block can't be blank"
      end


      it '電話番号が空では登録できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number can't be blank"
      end

      it '電話番号が半角数字以外では登録できない' do
        @order.phone_number = '１１１１'
        @order.valid?
        expect(@order.errors.full_messages).to include 'Phone number is invalid.'
      end

      it '電話番号が半角数字以外では登録できない' do
        @order.phone_number = '090111'
        @order.valid?
        expect(@order.errors.full_messages).to include 'Phone number is invalid.'
      end

      it 'tokenが空では登録できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
