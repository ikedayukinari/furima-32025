# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column               | Type        | Options                        |
| -------------------- | ----------- | ------------------------------ |
| name                 | string      | null: false                    |
| description          | text        | null: false                    |
| category_id          | integer     | null: false                    |
| condition_id         | integer     | null: false                    |
| shipping_charges_id  | integer     | null: false                    |
| shipping_area_id     | integer     | null: false                    |
| days_to_ship_id      | integer     | null: false                    |
| selling_price        | integer     | null: false                    |
| user                 | references  | null: false, foreign_key: true |


### Association

- has_many :purchases
- belongs_to :user


## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## address テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| postal_code     | string    | null: false                    |
| prefectures_id  | integer   | null: false                    |
| municipality    | string    | null: false                    |
| house_number    | string    | null: false                    |
| building_name   | string    |                                |
| phone_number    | string    | null: false                    |
| purchase        | reference | null: false, foreign_key: true |

### Association

- belongs_to :purchase