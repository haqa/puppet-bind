# Convert an IP addres into the /24 in-addr.arpa zone name
module Puppet::Parser::Functions
    newfunction(:ptrzone, :type => :rvalue) do |arguments|
        require 'ipaddr'
        if (arguments.size != 1) then
            raise(Puppet::ParseError, "ptrzone(): Wrong number of arguments")
        end
        ip = IPAddr.new(arguments[0]).reverse.split(".")
        return ip.drop(1).join(".") + ".in-addr.arpa"
    end
end