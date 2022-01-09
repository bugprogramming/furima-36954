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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nick_name          | string | null: false |

## Association
- has_many :tweets
- has_many :purchases
- has_one  : profiles


## profiles テーブル

| Column                | Type      | Options                         |
| ----------------------| --------- | --------------------------------|
| user_id_year          | integer   | null: false                     |
| user_id_month         | integer   | null: false                     |
| user_id_date          | integer   | null: false                     |
| password_confirmation | string    | null: false                     |
| first_name            | string    | null: false                     |
| last_name             | string    | null: false                     |
| first_name_jpn        | string    | null: false                     |
| last_name_jpn         | string    | null: false                     |
| use_id                | references| null: false, foreign_key: true  |


## Association
- belongs_to :users

## tweets テーブル

| Column                | Type      | Options                         |
| ----------------------| --------- | --------------------------------|
| text                  | text      | null: false                     |
| tweet_name            | string    | null: false                     |
| price                 | integer   | null: false                     |
| use_id                | references| null: false, foreign_key: true  |


## Association
- belongs_to :users
- has_one    : purchase
- has_one    : tweets_profiles


## tweet_profiles テーブル

| Column                | Type      | Options                         |
| ----------------------| --------- | --------------------------------|
| tweet_id_categories   | integer   | null: false                     |
| tweet_id_conditions   | integer   | null: false                     |
| tweet_id_area         | integer   | null: false                     |
| tweet_id_data         | integer   | null: false                     |
| tweet_id              | references| null: false, foreign_key: true  |


## Association
- belongs_to :tweets

## purchases テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| credit_info        | integer    | null: false                     |
| address            | string     | null: false                     |
| tweet_id           | references | null: false, foreign_key: true  |
| use_id             | references | null: false, foreign_key: true  |


## Association
- belongs_to : users
- has_one    : tweets
- has_one    : addresses
- has_one    : credit_details


## credit_details テーブル

| Column                | Type      | Options                         |
| ----------------------| --------- | --------------------------------|
| card_info             | integer   | null: false                     |
| effectiveness_month   | integer   | null: false                     |
| effectiveness_year    | integer   | null: false                     |
| security_number       | integer   | null: false                     |
| purchase_id           | references| null: false, foreign_key: true  |


## Association
- belongs_to :purchases

## addresses テーブル

| Column                  | Type      | Options                         |
| ----------------------- | --------- | ------------------------------- |
| post_code               | integer   | null: false                     |
| purchase_id_prefectures | integer   | null: false                     |
| municipalities          | string    | null: false                     |
| address_number          | string    | null: false                     |
| building                | string    |                                 |
| phone_number            | integer   | null: false                     |
| purchase_id             | references| null: false, foreign_key: true  |
 

## Association
- belongs_to :purchases