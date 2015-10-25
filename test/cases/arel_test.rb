require_relative 'test_helper'

class ArelTest < ActiveSupport::TestCase
  def test_postgis_visitor
    assert Arel::Visitors::VISITORS['postgresql'].new(connection).respond_to? :st_func
  end
end
