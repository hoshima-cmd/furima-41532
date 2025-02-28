require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_order = FactoryBot.build(:item_order, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @item_order.user_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @item_order.item_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空欄だと保存できない' do
        @item_order.post_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号にハイフンがないと保存できない' do
        @item_order.post_code = 1_234_123
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号は3桁ハイフン4桁の半角文字列のみでないと保存できない' do
        @item_order.post_code = 1234 - 567
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が空欄だと保存できない' do
        @item_order.region_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Region can't be blank", "Region can't be blank")
      end
      it '都道府県の情報が「---」だと保存できない' do
        @item_order.region_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Region can't be blank")
      end
      it '市町村が空欄だと保存できない' do
        @item_order.prefecture = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '番地が空欄だと保存できない' do
        @item_order.street_address = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Street address can't be blank")
      end
      it '電話番号が空欄だと保存できない' do
        @item_order.telephone_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Telephone number can't be blank", "Telephone number is invalid.")
      end
      it '電話番号が10桁以上の半角数値のみでないと保存できない' do
        @item_order.telephone_number = 880_255_312
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Telephone number is invalid.")
      end
      it '電話番号が11桁以内の半角数値のみでないと保存できない' do
        @item_order.telephone_number = 880_255_312_333
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Telephone number is invalid.")
      end
      it '電話番にハイフンがあると保存できない' do
        @item_order.telephone_number = 980 - 2774 - 9067
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Telephone number is invalid.")
      end
      it 'トークンが空だと保存できないこと' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
    end
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_order).to be_valid
      end
      it '建物名は空でも購入できる' do
        @item_order.building = nil
        expect(@item_order).to be_valid
      end
    end
  end
end
