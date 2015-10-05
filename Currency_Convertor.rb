require "soap/wsdlDriver"

print "From Currency: "
from_currency = gets.chomp.to_s

print "To Currency: "
to_currency = gets.chomp.to_s

wsdl = "http://www.webservicex.net/CurrencyConvertor.asmx?WSDL"

driver = SOAP::WSDLDriverFactory.new(wsdl).create_rpc_driver

#driver.wiredump_dev = STDOUT

params = {
	"FromCurrency" => from_currency,
	"ToCurrency" => to_currency
}

result = driver.conversionRate(params).conversionRateResult

puts "\n\n"
print "#{from_currency} => #{to_currency} : "
puts result
puts "\n\n"