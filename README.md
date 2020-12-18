# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | --------------------------|
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

### Assosiation

- has_many :comments
- has_many :items
- has_many :orders 


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| introduction    | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| ship_date_id    | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Assosiation

- belongs_to :user
- has_many :comments
- has_one :order


## comments テーブル

| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| text       | text         | null: false                    |
| user       | references   | null: false, foreign_key: true |
| item       | references   | null: false, foreign_key: true |

### Assosiation

- belongs_to :user
- belongs_to :item


## orders テーブル

| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| user       | references   | null: false, foreign_key: true |
| item       | references   | null: false, foreign_key: true |

### Assosiation

- belongs_to :user
- belongs_to :item
- has_one :shipping_adress


## shipping_adresses テーブル

| Column        | Type         | Options                        |
| ------------- | ------------ | ------------------------------ |
| postcode      | string       | null: false                    |
| prefecture_id | integer      | null: false                    |
| city          | string       | null: false                    |
| block         | string       | null: false                    |
| building      | string       |                                |
| phone_number  | string       | null: false                    |
| order         | references   | null: false, foreign_key: true |
### Assosiation

- belongs_to :order