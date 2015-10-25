require_relative 'test_helper'

class ColumnTest < ActiveSupport::TestCase
  def test_column_classes
    assert_instance_of ActiveRecord::ConnectionAdapters::PostgreSQLColumn, Geometry.columns[1] #t.string :name
    refute_instance_of ActiveRecord::PostGIS::Column, Geometry.columns[2] #t.text :long_name
    assert_instance_of ActiveRecord::PostGIS::Column, Geometry.columns[3] #t.st_point 'point'
  end
end
