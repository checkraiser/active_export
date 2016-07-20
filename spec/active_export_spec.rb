require 'spec_helper'

describe ActiveExport do
  it 'has a version number' do
    expect(ActiveExport::VERSION).not_to be nil
  end

  it 'export methods with underscore as key in json export' do
    class A
      include ActiveExport::JsonExport
      protected
      def _method1
        'method1'
      end
      def method2(x)
        x
      end
      def method3(a:, b:)
        'hello world'
      end
    end
    a = A.new
    expect(a.as_json).to eql({:_method1 => "method1"})
  end
end
