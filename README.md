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


Add JS to new/edit form with http://railscasts.com/episodes/196-nested-model-form-revised?autoplay=true

http://api.rubyonrails.org/classes/ActiveRecord/Scoping/Named/ClassMethods.html
Scope method:
class Article < ActiveRecord::Base
  scope :published, -> { where(published: true) }
  scope :featured, -> { where(featured: true) }

  def self.latest_article
    order('published_at desc').first
  end

  def self.titles
    pluck(:title)
  end
end

