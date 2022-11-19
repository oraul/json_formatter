require 'minitest/autorun'
require 'json_formatter'

class JsonFormatterTest < Minitest::Test
  def test_call
    expected = {
      severity: 'INFO',
      timestamp: '2022-11-19T15:47:47-03:00',
      progname: 'test',
      message: 'Foo'
    }.to_json

    actual = JsonFormatter.new.call('INFO', '2022-11-19T15:47:47-03:00', 'test', 'Foo')
    assert_equal(expected, actual)
  end
end
