# DB 設計

## users テーブル
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| nickname           | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday_id        | integer | null: false |

### Association

* has_many :items
* has_many :comments

## items テーブル
| Column             | Type         | Options     |
| ------------------ | -------------| ----------- |
| product_name       | string       | null: false |
| explanation        | text         | null: false |
| category_id        | integer      | null: false |
| state_id           | integer      | null: false |
| price              | integer      | null: false |
| shipping_fee_id    | integer      | null: false |
| region_id          | integer      | null: false |
| day_id             | integer      | null: false |
| user               | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :comment

## sells テーブル
| Column             | Type         | Options     |
| ------------------ | -------------| ----------- |
| purchaser          | string       | null: false |
| Shipping_address   | string       | null: false |
| item               | references   | null: false, foreign_key: true |
| comment            | references   | null: false, foreign_key: true |

### Association

- belongs_to :comment

## comments テーブル
| Column             | Type         | Options     |
| ------------------ | -------------| ----------- |
| item               | references   | null: false, foreign_key: true |
| user               | references   | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :sell