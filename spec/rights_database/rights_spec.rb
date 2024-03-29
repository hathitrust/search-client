# frozen_string_literal: true

require "spec_helper"
require "rights_database/rights"

RSpec.describe RightsDatabase::Rights do
  describe "#new" do
    it "retrieves a rights record for an item id" do
      item_rights = RightsDatabase::Rights.new(item_id: "uva.x001592955")
      expect(item_rights.attribute.id).to eq(22)
      expect(item_rights.reason.id).to eq(3)
    end

    it "returns an 'unknown' code when the item isn't in rights" do
      item_rights = RightsDatabase::Rights.new(item_id: "test.nonexistent")
      expect(item_rights.attribute.name).to eq("unknown")
      expect(item_rights.reason.name).to eq("unknown")
    end
  end
end
