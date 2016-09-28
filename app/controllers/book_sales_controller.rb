class BookSalesController < ApplicationController
  def book
   render action: "book", layout: "/layouts/book"
  end
end
