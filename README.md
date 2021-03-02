# DB　設計

## Users table

| Column             |Type      |Options        |
| ------------------ | -------- | ------------- |
| nickname           | string   | null: false   |
| email              | string   | null: false   |
| password           | string   | null: false   |
| family_name        | string   | null: false   |
| last_name          | string   | null: false   |
| family_name_kana   | string   | null: false   |
| last_name_kana     | string   | null: false   |
| birthday           | date     | null: false   |

### Association
* has_many :items
* has_many :orders

## Items table

| Column        |Type          |Options              |
| ------------- | ------------ | ------------------- |
| image         |              |                     |
| item_name     | string       | null: false         |
| description   | text         | null: false         |
| category      | string       | null: false         |
| status        | string       | null: false         |
| cost          | string       | null: false         |
| area          | string       | null: false         |
| days          | date         | null: false         |
| price         | string       | null: false         |
| user          | references   | foreign_key: true   |


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

|Column          |Type      |Options        |
| -------------- | -------- | ------------- |
| postal_code    | string   | null: false   |
| prefecture     | string   | null: false   |
| municipality   | string   | null: false   |
| address        | string   | null: false   |
| building       | string   |               |
| phone_num      | string   | null: false   |


### Association
* belongs_to order