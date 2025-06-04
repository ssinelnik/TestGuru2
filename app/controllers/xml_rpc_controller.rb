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
    require 'xmlrpc/server'

    # Используем внутренний метод сервера для парсинга
    server = XMLRPC::Server.new
    @request = server.send(:parse_methodCall, request.raw_post)

  rescue StandardError => e
    Rails.logger.error "XML-RPC Parsing Error: #{e.message}\n#{e.backtrace.join("\n")}"
    render_xml_rpc_fault(400, "Invalid XML-RPC request: #{e.message}")
  end

  def render_xml_rpc(result)
    builder = Builder::XmlMarkup.new(indent: 2)
    xml = builder.methodResponse do |resp|
      resp.params do |p|
        p.param do |par|
          par.value { XMLRPC::Marshal.dump_value(result) }
        end
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
