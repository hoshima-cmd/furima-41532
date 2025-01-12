# DB 設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name               | string | null: false |
| profile            | text   | null: false |

## items テーブル
| Column             | Type         | Options     |
| ------------------ | -------------| ----------- |
| product_name       | string       | null: false |
| category           | string       | null: false |
| price              | string       | null: false |
| user               | references   | null: false, foreign_key: true |

## sell テーブル
| Column             | Type         | Options     |
| ------------------ | -------------| ----------- |
| shipping_fee       | string       | null: false |
| region             | string       | null: false |
| days               | string       | null: false |
| user               | references   | null: false, foreign_key: true |
| items              | references   | null: false, foreign_key: true |