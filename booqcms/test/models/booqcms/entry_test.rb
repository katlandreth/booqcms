require 'test_helper'

module Dashboard
  class EntryTest < ActiveSupport::TestCase

    def setup
      @entry = Entry.new
    end

    #Validations

    test "save incomplete entry" do
      @entry.payload = "body text"
      assert @entry.save
    end

    test "publish complete entry" do
      @entry.update(payload: "body text",
      featured_image: "http://cdn.spacetelescope.org/archives/images/large/heic1509a.jpg")
      @entry.update(published_at: Time.now)
      assert @entry.save!
    end

    test "don't publish imcomplete entry" do
      @entry.published_at = Time.now
      assert_not @entry.save
    end
  end
end
