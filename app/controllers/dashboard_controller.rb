class DashboardController < ApplicationController
  include CsvHelper
  def index
    @todays_earnings = Receipt.where("created_at >= ?", Time.zone.today.beginning_of_day).sum(:amount)
  end

  def generate_csv
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    case params[:report_type]
    when "order"
      orders = Order.where(created_at: start_date.beginning_of_day..end_date.end_of_day)
      csv_data = CsvHelper.generate_order_csv(orders)
      filename = "orders-#{start_date}-to-#{end_date}.csv"
    when "bill"
      bills = Bill.where(created_at: start_date.beginning_of_day..end_date.end_of_day)
      csv_data = CsvHelper.generate_bill_csv(bills)
      filename = "bills-#{start_date}-to-#{end_date}.csv"
    when "receipt"
      receipts = Receipt.where(created_at: start_date.beginning_of_day..end_date.end_of_day)
      csv_data = CsvHelper.generate_receipt_csv(receipts)
      filename = "receipts-#{start_date}-to-#{end_date}.csv"
    else
      raise "Invalid data type"
    end

    respond_to do |format|
      format.csv do
        send_data csv_data, filename: filename
      end
    end
  end
end
