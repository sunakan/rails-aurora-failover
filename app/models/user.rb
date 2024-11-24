class User < ApplicationRecord
  def self.create_with_transaction_reconnect
    debugger
    ActiveRecord::Base.transaction do
      foo = User.new(name: 'foo')
      foo.save!
      ActiveRecord::Base.connection.reconnect!
      bar = User.new(name: 'bar')
      bar.save!
    end
  end

  def self.create_with_transaction
    ActiveRecord::Base.transaction do
      foo = User.new(name: 'foo')
      foo.save!
      bar = User.new(name: 'bar')
      bar.save!
    end
  end
end
