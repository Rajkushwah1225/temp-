class TransactionSerializer < ActiveModel::Serializer
  attributes :status 
  attributes :transaction_id

  def status
    "success"
  end
end
