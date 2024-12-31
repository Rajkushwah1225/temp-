class ExternalApi
    def self.fetch_single_transaction
      { transaction_id: SecureRandom.uuid, points: rand(1..100), user_id: SecureRandom.hex(5) }
    end
  
    def self.fetch_bulk_transactions
      Array.new(5) { fetch_single_transaction }
    end
end
