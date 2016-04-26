require 'test_helper'

module Booqcms
  class EntryTest < ActiveSupport::TestCase

    def setup
      @entry = Entry.new
    end

    #Payload

    test "save entry with payload" do
      @entry.payload = "body text"
      assert @entry.save
    end

    test "publish entry with payload" do
      @entry.update(payload: "body text")
      @entry.update(published_at: Time.now)
      assert @entry.save
    end

    test "don't publish entry without payload" do
      @entry.published_at = Time.now
      assert_not @entry.save
      puts @entry.inspect
    end

    # test "entry saves title" do
    #   assert true
    # end
    #
    # test "entry saves type" do
    #   assert true
    # end
    #
    # test "entry saves slug" do
    #   assert true
    # end
    #
    # test "entry saves user id" do
    #   assert true
    # end
    #
    # test "entry saves author name" do
    #   assert true
    # end
    #
    # test "entry saves featured image" do
    #   assert true
    # end

  end
end
