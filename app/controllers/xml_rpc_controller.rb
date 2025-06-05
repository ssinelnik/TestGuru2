require 'xmlrpc/parser'
require 'xmlrpc/marshal'
require 'rexml/document'

class XmlRpcController < ApplicationController
  # Отключаем проверку CSRF-токена, так как XML-RPC клиенты не используют его
  skip_before_action :verify_authenticity_token

  # Перед выполнением экшена парсим XML-RPC запрос
  before_action :parse_xml_rpc_request

  # Основная точка входа для XML-RPC запросов
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

  def render_xml_rpc(result)
    builder = Builder::XmlMarkup.new(indent: 2)
    xml = builder.methodResponse do |resp|
      resp.params do |params|
        params.param do |param|
         param.value do |v|
            v.int result.to_s
          end
        end
      end
    end
    render xml: xml, status: :ok
  end

  def parse_xml_rpc_request
    if request.content_type&.include?('application/x-www-form-urlencoded')
      @request = {
        method_name: params[:method_name],
        params: extract_params_from_form
      }
    else
      xml = request.raw_post
      parser = XMLRPC::XMLParser::REXMLStreamParser.new
      method_name, method_params = parser.parseMethodCall(xml)
      @request = {
        method_name: method_name,
        params: method_params
      }
    end
  rescue => e
    render_xml_rpc_fault(500, "Parse error: #{e.message}")
  end

  # Формирует и возвращает XML-RPC fault-ответ с кодом и сообщением об ошибке
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

def extract_params_from_form
  case params[:method_name]
  when 'test.add'
    param1 = params[:param1]&.to_i || 0
    param2 = params[:param2]&.to_i || 0
    [param1, param2]
  when 'user.get'
    user_id = params[:user_id]&.to_i
    raise ArgumentError, "user_id is required" unless user_id&.positive?
    [user_id]
  else
    []
  end
end
