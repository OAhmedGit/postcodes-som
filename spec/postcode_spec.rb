git require 'spec_helper'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_single_postcode('se96rj')
    end

    it "should respond with a status message of 200" do
      expect(@response['status']).to eq 200
    end

    it "should have a results hash" do
      expect(@response['result']).to be_kind_of(Hash)
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@response['result']['postcode'].gsub(' ','').length).to be_between(5,7)
    end

    it "should return an quality key integer between 1-9" do
      expect(@response['result']['quality']).to be_kind_of(Integer)
      expect(@response['result']['quality']).to be_between(1,9)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@response['result']['eastings']).to be_kind_of(Integer)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@response['result']['northings']).to be_kind_of(Integer)
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@response['result']['country']).to match("England").or match("Scotland")
    end

    it "should return a string value for NHS authority " do
      expect(@response['result']['country']).to be_kind_of(String)
    end

    it "should return a longitude float value" do
      expect(@response['result']['longitude']).to be_kind_of(Float)
    end

    it "should return a latitude float value" do
      expect(@response['result']['latitude']).to be_kind_of(Float)
    end

    it "should return a parliamentary constituency string" do
      expect(@response['result']['parliamentary_constituency']).to be_kind_of(String)
    end

    it "should return a european_electoral_region string" do
      expect(@response['result']['european_electoral_region']).to be_kind_of(String)
    end

    it "should return a primary_care_trust string" do
      expect(@response['result']['primary_care_trust']).to be_kind_of(String)
    end

    it "should return a region string" do
      expect(@response['result']['region']).to be_kind_of(String)
    end

    it "should return a parish string" do
      expect(@response['result']['parish']).to be_kind_of(String)
    end

    it "should return a lsoa string" do
      expect(@response['result']['lsoa']).to be_kind_of(String)
    end

    it "should return a msoa string" do
      expect(@response['result']['msoa']).to be_kind_of(String)
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@response['result']['admin_district']).to be_kind_of(String)
    end

    it "should return a incode string of three characters" do
      expect(@response['result']['incode']).to be_kind_of(String)
      expect(@response['result']['incode'].length).to eq 3
    end

    it "should return a msoa string" do
      expect(@response['result']['msoa']).to be_kind_of(String)
    end

    it "should return a incode string of 3-4 characters" do
      expect(@response['result']['outcode']).to be_kind_of(String)
      expect(@response['result']['outcode'].length).to be_between(3,4)
    end
  end

  context "multiple postcodes validation" do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_multiple_postcodes(["se96rj", "se38pf"])
      @first_result = @response["result"][0]
      @second_result = @response["result"][1]
    end

    it "should respond with a status message of 200" do
      expect(@response['status']).to eq 200
    end

    it "should return the first query as the first postcode in the response" do
      expect(@first_result["query"]).to eq "se96rj"
    end

    it "should return the second query as the first postcode in the response" do
      expect(@second_result["query"]).to eq "se38pf"
    end

    it "should have a results hash" do
      expect(@first_result['result']).to be_kind_of(Hash)
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@first_result['result']['postcode'].gsub(' ','').length).to be_between(5,7)
    end

    it "should return an quality key integer between 1-9" do
      expect(@first_result['result']['quality']).to be_kind_of(Integer)
      expect(@first_result['result']['quality']).to be_between(1,9)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@first_result['result']['eastings']).to be_kind_of(Integer)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@first_result['result']['northings']).to be_kind_of(Integer)
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@first_result['result']['country']).to eq("England")
    end

    it "should return a string value for NHS authority " do
      expect(@first_result['result']['country']).to be_kind_of(String)
    end

    it "should return a longitude float value" do
      expect(@first_result['result']['longitude']).to be_kind_of(Float)
    end

    it "should return a latitude float value" do
      expect(@first_result['result']['latitude']).to be_kind_of(Float)
    end

    it "should return a parliamentary constituency string" do
      expect(@first_result['result']['parliamentary_constituency']).to be_kind_of(String)
    end

    it "should return a european_electoral_region string" do
      expect(@first_result['result']['european_electoral_region']).to be_kind_of(String)
    end

    it "should return a primary_care_trust string" do
      expect(@first_result['result']['primary_care_trust']).to be_kind_of(String)
    end

    it "should return a region string" do
      expect(@first_result['result']['region']).to be_kind_of(String)
    end

    it "should return a parish string" do
      expect(@first_result['result']['parish']).to be_kind_of(String)
    end

    it "should return a lsoa string" do
      expect(@first_result['result']['lsoa']).to be_kind_of(String)
    end

    it "should return a msoa string" do
      expect(@first_result['result']['msoa']).to be_kind_of(String)
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@first_result['result']['admin_district']).to be_kind_of(String)
    end

    it "should return a incode string of three characters" do
      expect(@first_result['result']['incode']).to be_kind_of(String)
      expect(@first_result['result']['incode'].length).to eq 3
    end

    it "should return a msoa string" do
      expect(@first_result['result']['msoa']).to be_kind_of(String)
    end

    it "should return a incode string of 3-4 characters" do
      expect(@first_result['result']['outcode']).to be_kind_of(String)
      expect(@first_result['result']['outcode'].length).to be_between(3,4)
    end

    it "should have a results hash" do
      expect(@second_result['result']).to be_kind_of(Hash)
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@second_result['result']['postcode'].gsub(' ','').length).to be_between(5,7)
    end

    it "should return an quality key integer between 1-9" do
      expect(@second_result['result']['quality']).to be_kind_of(Integer)
      expect(@second_result['result']['quality']).to be_between(1,9)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@second_result['result']['eastings']).to be_kind_of(Integer)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@second_result['result']['northings']).to be_kind_of(Integer)
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@second_result['result']['country']).to eq("England")
    end

    it "should return a string value for NHS authority " do
      expect(@second_result['result']['country']).to be_kind_of(String)
    end

    it "should return a longitude float value" do
      expect(@second_result['result']['longitude']).to be_kind_of(Float)
    end

    it "should return a latitude float value" do
      expect(@second_result['result']['latitude']).to be_kind_of(Float)
    end

    it "should return a parliamentary constituency string" do
      expect(@second_result['result']['parliamentary_constituency']).to be_kind_of(String)
    end

    it "should return a european_electoral_region string" do
      expect(@second_result['result']['european_electoral_region']).to be_kind_of(String)
    end

    it "should return a primary_care_trust string" do
      expect(@second_result['result']['primary_care_trust']).to be_kind_of(String)
    end

    it "should return a region string" do
      expect(@second_result['result']['region']).to be_kind_of(String)
    end

    it "should return a parish string" do
      expect(@second_result['result']['parish']).to be_kind_of(String)
    end

    it "should return a lsoa string" do
      expect(@second_result['result']['lsoa']).to be_kind_of(String)
    end

    it "should return a msoa string" do
      expect(@second_result['result']['msoa']).to be_kind_of(String)
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@second_result['result']['admin_district']).to be_kind_of(String)
    end

    it "should return a incode string of three characters" do
      expect(@second_result['result']['incode']).to be_kind_of(String)
      expect(@second_result['result']['incode'].length).to eq 3
    end

    it "should return a msoa string" do
      expect(@second_result['result']['msoa']).to be_kind_of(String)
    end

    it "should return a incode string of 3-4 characters" do
      expect(@second_result['result']['outcode']).to be_kind_of(String)
      expect(@second_result['result']['outcode'].length).to be_between(3,4)
    end

  end


end
