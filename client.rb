require 'grpc'
require_relative './lib/payments_services_pb'

def main
  client = Payments::Bitcoin::Stub.new('https://40c3-45-17-113-222.ngrok-free.app:50051', :this_channel_is_insecure)

  from_addr = '123456'
  to_addr = '6554321'
  amount = 22

  request = Payments::BTCPaymentRequest.new(
    from_addr: from_addr,
    to_addr: to_addr,
    amount: amount
  )

  response = client.send_payment(request)

  puts "Result: #{response.sum}"
end

main
