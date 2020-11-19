# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| name             | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| first_name       | string | null: false |
| last_name        | string | null: false |
| first_name_kana  | string | null: false |
| last_name_kana   | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items
- has_one :buyer
- has_one :credit_card

## buyers テーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| postal_code    | integer   | null: false                    |
| prefectures    | string    | null: false                    |
| municipality   | string    | null: false                    |
| address        | text      | null: false                    |
| building_name  | string    |                                |
| phone_number   | integer   | null: false                    |
| user           | reference | null: false, foreign_key: true |

### Association

- belongs_to :user

## credit_cards テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| number           | integer    | null: false                    |
| expiration_date  | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## items テーブル

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| image             | string      |                                |
| name              | string      |                                |
| description       | text        |                                |
| category          | string      |                                |
| condition         | string      |                                |
| shipping_charges  | string      |                                |
| shipping_area     | string      |                                |
| days_to_ship      | date        |                                |
| selling_price     | integer     |                                |
| user              | references  | null: false, foreign_key: true |


### Association

- belongs_to :user
