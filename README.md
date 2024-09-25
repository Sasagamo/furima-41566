# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| nickname           | string | null:false  |
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

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| description        | text       | null: false |
| price              | integer    | null: false |
| category           | string     | null: false |
| shipping_fee_payer | boolean    | null: false |
| shipping_days      | string     | null: false |
| shipping_region    | string     | null: false |
| user_id            | references | null:false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| phone_number  | string     | null: false |
| postal_code   | string     | null: false |
| prefecture    | string     | null: false |
| city          | string     | null: false |
| street_number | string     | null: false |
| building_name | string     |             |
| order_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :order

