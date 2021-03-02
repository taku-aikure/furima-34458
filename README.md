# DB　設計

## Users table

| Column             |Type      |Options        |
| ------------------ | -------- | ------------- |
| nickname           | string   | null: false   |
| email              | string   | unique: true, null: false ｜
| encrypted_password | string   | null: false   |
| family_name        | string   | null: false   |
| last_name          | string   | null: false   |
| family_name_kana   | string   | null: false   |
| last_name_kana     | string   | null: false   |
| birthday           | date     | null: false   |

### Association
* has_many :items
* has_many :orders

## Items table

| Column           |Type           |Options              |
| ---------------- | ------------- | ------------------- |
| name     　　   　| string        | null: false         |
| description      | text          | null: false         |
| category_id      | integer       | null: false         |
| status_id        | integer       | null: false         |
| cost_id          | integer       | null: false         |
| area_id          | integer       | null: false         |
| days_id          | integer       | null: false         |
| price            | integer       | null: false         |
| user             | references    | foreign_key: true   |


### Association
* belongs_to :user
* has_one :order

## Orders table

|Column  |Type          |Options              |
| ------ | ------------ | ------------------- |
| user   | references   | foreign_key: true   |
| item   | references   | foreign_key: true   |


### Association
* belongs_to :user
* belongs_to :item
* has_one :shipping_info

## Shipping_info table

|Column          |Type         |Options            |
| -------------- | ----------- | ----------------- |
| postal_code    | string      | null: false       |
| prefecture_id  | integer     | null: false       |
| municipality   | string      | null: false       |
| address        | string      | null: false       |
| building       | string      |                   |
| phone_num      | string      | null: false       |
| order          | references  | foreign_key: true |

### Association
* belongs_to order