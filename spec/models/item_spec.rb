require 'rails_helper'

RSpec.describe '商品出品機能', type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  context '出品登録ができるとき' do
    it '全ての入力事項が、あれば登録できる' do
      expect(@item).to be_valid
    end
  end
  context '商品出品ができないとき' do
    it 'Userが紐づいていないと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
    it '商品名が空だと出品できない' do
      @item.product_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it '商品の説明が空だと出品できない' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'カテゴリーの情報が「---」だと出品できない' do
      @item.category_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'カテゴリーの情報が空だと出品できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態の情報が「---」だと出品できない' do
      @item.state_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank")
    end
    it '商品の状態の情報が空だと出品できない' do
      @item.state_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank", "State can't be blank")
    end
    it '配送料の負担の情報が「---」だと出品できない' do
      @item.shipping_fee_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end
    it '配送料の負担の情報が空だと出品できない' do
      @item.shipping_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end
    it '発送元の地域の情報が「---」だと出品できない' do
      @item.region_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include("Region can't be blank")
    end
    it '発送元の地域の情報が空だと出品できない' do
      @item.region_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Region can't be blank", "Region can't be blank")
    end
    it '発送までの日数の情報が「---」だと出品できない' do
      @item.num_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include("Num can't be blank")
    end
    it '発送までの日数の情報が空だと出品できない' do
      @item.num_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Num can't be blank", "Num can't be blank")
    end
    it '価格が空だと出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
    end
    it '価格が、300円未満だと出品できない' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格が、9,999,999円を超えると出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it '価格は半角数字で入力しないと出品できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it '１枚画像がないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end
