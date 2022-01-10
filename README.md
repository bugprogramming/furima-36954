# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column                | Type   | Options                        |
| --------------------- | ------ | ------------------------------ |
| email                 | string | null: false, foreign_key: true |
| encrypted_password    | string | null: false                    |
| nickname              | string | null: false                    |
| birthday_id           | date   | null: false                    |
| first_name            | string | null: false                    |
| last_name             | string | null: false                    |
| first_name_jpn        | string | null: false                    |
| last_name_jpn         | string | null: false                    |

## Association
- has_many :tweets
- has_many :purchases



## tweets テーブル

| Column       | Type      | Options                         |
| -------------| --------- | --------------------------------|
| explain      | text      | null: false                     |
| tweet_name   | string    | null: false                     |
| price        | integer   | null: false                     |
| category_id  | integer   | null: false                     |
| condition_id | integer   | null: false                     |
| area_id      | integer   | null: false                     |
| delivery_id  | integer   | null: false                     |
| send_style_id| integer   | null: false                     |
| user         | references| null: false, foreign_key: true  |

## Association
- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| tweet              | references | null: false, foreign_key: true  |
| user               | references | null: false, foreign_key: true  |


## Association
- belongs_to : user
- belongs_to : tweet
- has_one    : address

## addresses テーブル

| Column                  | Type      | Options                         |
| ----------------------- | --------- | ------------------------------- |
| phone_number            | string    | null: false                     |
| post_code               | string    | null: false                     |
| area_id                 | integer   | null: false                     |
| municipalities          | string    | null: false                     |
| address_number          | string    | null: false                     |
| building                | string    |                                 |
| purchase                | references| null: false, foreign_key: true  |
 

## Association
- belongs_to :purchase