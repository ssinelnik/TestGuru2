class XmlRpcController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :parse_xml_rpc_request

  def endpoint
    method = @request[:method_name]
    params = @request[:params]

    # Обработка методов API
    case method
    when 'test.add'
      result = params[0] + params[1]
      render_xml_rpc(result)
    when 'user.get'
      user = User.find(params[0])
      render_xml_rpc(user.to_h)
    else
      render_xml_rpc_fault(404, "Method #{method} not found")
    end
  end

  private

  def parse_xml_rpc_request
    require 'xmlrpc/parser'
    parser = XMLRPC::XMLParser.new
    @request = parser.parse(request.raw_post)
  rescue => e
    render_xml_rpc_fault(400, "Invalid XML-RPC request: #{e.message}")
  end

  def render_xml_rpc(result)
    builder = Builder::XmlMarkup.new(indent: 2)
    xml = builder.methodResponse do |resp|
      resp.params do |p|
        p.param { |par| par.value { XMLRPC::Marshal.dump_value(par, result) } }
      end
    end
    render xml: xml
  end

  def render_xml_rpc_fault(code, message)
    builder = Builder::XmlMarkup.new(indent: 2)
    xml = builder.methodResponse do |resp|
      resp.fault do |f|
        f.value do |v|
          v.struct do |s|
            s.member { |m| m.name("faultCode"); m.value(code) }
            s.member { |m| m.name("faultString"); m.value(message) }
          end
        end
      end
    end
    render xml: xml, status: :internal_server_error
  end
end
