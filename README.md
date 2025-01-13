# DB 設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| name               | string | null: false |
| birthday           | string | null: false |

### Association

* has_many :items
* has_many :comments

## items テーブル
| Column             | Type         | Options     |
| ------------------ | -------------| ----------- |
| image              | text         | null: false |
| product_name       | string       | null: false |
| explanation        | text         | null: false |
| category           | string       | null: false |
| state              | string       | null: false |
| price              | string       | null: false |
| shipping_fee       | string       | null: false |
| region             | string       | null: false |
| days               | string       | null: false |
| users              | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :sells

## sells テーブル
| Column             | Type         | Options     |
| ------------------ | -------------| ----------- |
| purchaser          | string       | null: false |
| Shipping_address   | string       | null: false |
| item               | references   | null: false, foreign_key: true |
| user               | references   | null: false, foreign_key: true |

### Association

- belongs_to :item

## comments テーブル
| Column             | Type         | Options     |
| ------------------ | -------------| ----------- |
| content            | text         | null: false |
| item               | references   | null: false, foreign_key: true |
| user               | references   | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user