class Api::V1::TransactionsController < ApplicationController
    def single
      single_transaction_data = ExternalApi.fetch_single_transaction 
      transaction = Transaction.new(single_transaction_data)
  
      if transaction.save
        render json: transaction, status: :created
      else
        render json: { status: "error", errors: transaction.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def bulk
      bulk_transactions_data = ExternalApi.fetch_bulk_transactions 
      transactions = bulk_transactions_data.map { |data| Transaction.new(data) }
      successful_transactions = transactions.select(&:save).count
      
      if successful_transactions > 0
        render json: { status: "success", processed_count: successful_transactions }, status: :created
      else
        errors = transactions.select { |t| !t.valid? }.map(&:errors).flat_map(&:full_messages)
        render json: { status: "error", errors: errors }, status: :unprocessable_entity
      end   
    end
  end
  