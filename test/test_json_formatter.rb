require 'minitest/autorun'
require 'json_formatter'

class JsonFormatterTest < Minitest::Test
  def test_string_message
    expected = {
      severity: 'INFO',
      timestamp: '2022-11-19T15:47:47-03:00',
      progname: 'test',
      message: 'Foo'
    }.to_json

    actual = JsonFormatter.new.call('INFO', '2022-11-19T15:47:47-03:00', 'test', 'Foo')

    assert_equal(expected, actual)
  end

  def test_hash_message
    expected = {
      severity: 'INFO',
      timestamp: '2022-11-19T15:47:47-03:00',
      progname: 'test',
      message: 'Foo',
      custom: {
        foo: 'bar'
      }
    }.to_json

    actual = JsonFormatter.new.call('INFO', '2022-11-19T15:47:47-03:00', 'test', { message: 'Foo', custom: { foo: 'bar' } })

    assert_equal(expected, actual)
  end

  def test_exception_message
    expected = {
      severity: 'INFO',
      timestamp: '2022-11-19T15:47:47-03:00',
      progname: 'test',
      message: '#<StandardError: Foo>',
    }.to_json

    actual = JsonFormatter.new.call('INFO', '2022-11-19T15:47:47-03:00', 'test', StandardError.new('Foo'))

    assert_equal(expected, actual)
  end
end
