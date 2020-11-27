require 'rails_helper'

describe Destination do
  describe '#create_destination' do

    it "is valid with a destination" do
      destination = build(:destination) 
      expect(destination).to be_valid
    end

    it "is invalid without a family_name" do
      destination = build(:destination, family_name: "") 
      destination.valid?
      expect(destination.errors[:family_name]).to include("can't be blank")
    end

    it "is invalid without a first_name" do
      destination = build(:destination, first_name: "") 
      destination.valid?
      expect(destination.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without a family_name_kana" do
      destination = build(:destination, family_name_kana: "") 
      destination.valid?
      expect(destination.errors[:family_name_kana]).to include("can't be blank")
    end

    it "is invalid without a first_name_kana" do
      destination = build(:destination, first_name_kana: "") 
      destination.valid?
      expect(destination.errors[:first_name_kana]).to include("can't be blank")
    end

    it "is invalid without a post_code" do
      destination = build(:destination, post_code: "") 
      destination.valid?
      expect(destination.errors[:post_code]).to include("can't be blank")
    end

    it "is invalid without a prefecture_id " do
      destination = build(:destination, prefecture_id: "") 
      destination.valid?
      expect(destination.errors[:prefecture_id]).to include("can't be blank")
    end

    it "is invalid without a city" do
      destination = build(:destination, city: "") 
      destination.valid?
      expect(destination.errors[:city]).to include("can't be blank")
    end

    it "is invalid without a address" do
      destination = build(:destination, address: "") 
      destination.valid?
      expect(destination.errors[:address]).to include("can't be blank")
    end
  end
end