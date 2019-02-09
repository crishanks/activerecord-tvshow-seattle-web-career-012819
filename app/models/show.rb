require 'pry'

class Show < ActiveRecord::Base
    def self.highest_rating
        self.maximum(:rating)
    end

    def self.most_popular_show
        self.all.find do |show|
           show.rating == self.highest_rating
        end
    end

    def self.lowest_rating
        self.minimum(:rating)
    end

    def self.least_popular_show
        self.all.find do |show|
            show.rating == self.lowest_rating
        end
    end

    def self.ratings_sum
        self.all.sum(:rating)
    end

    def self.popular_shows
        self.all.where('rating > ?', 5)
    end

    def self.shows_by_alphabetical_order
        self.order(:name)
    end
end