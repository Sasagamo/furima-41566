# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| nickname           | string | null: false |
| encrypted_password | string | null: false |
| surname            | string | null: false |
| name               | string | null: false |
| surname_kana       | string | null: false |
| name_kana          | string | null: false |
| birthdate          | date   | null: false |

### Association

- has_many :items
- has_many :orders 

## items テーブル

| Column                | Type       | Options                  |
| --------------------- | ---------- | ------------------------ |
| name                  | string     | null: false              |
| description           | text       | null: false              |
| price                 | integer    | null: false              |
| category_id           | integer    | null: false (ActiveHash) |
| condition_id          | integer    | null: false (ActiveHash) |
| shipping_fee_payer_id | integer    | null: false (ActiveHash) |
| shipping_days_id      | integer    | null: false (ActiveHash) |
| prefecture_id         | integer    | null: false (ActiveHash) |
| user                  | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_fee_payer
- belongs_to_active_hash :shipping_days
- belongs_to_active_hash :prefecture

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                 |
| ------------- | ---------- | ----------------------- |
| phone_number  | string     | null: false             |
| postal_code   | string     | null: false             |
| prefecture_id | integer    | null: false(ActiveHash) |
| city          | string     | null: false             |
| street_number | string     | null: false             |
| building_name | string     |                         |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to_active_hash :prefecture