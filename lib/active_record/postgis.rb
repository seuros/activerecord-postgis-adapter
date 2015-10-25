require 'rgeo/active_record'
require 'active_record/connection_adapters/postgresql_adapter'

require_relative 'postgis/version'
require_relative 'postgis/schema_definitions'
require_relative 'postgis/schema_statements'
require_relative 'postgis/common_adapter_methods'
require_relative 'postgis/spatial_column_info'
require_relative 'postgis/column'
require_relative '../arel/visitors/postgis'
require_relative 'postgis/oid/spatial'
require_relative 'postgis/oid/st_geography'
require_relative 'postgis/oid/st_geometry'

module ActiveRecord
  module PostGIS # :nodoc:

    SPATIAL_DATABASE_TYPES = {
        st_point: '',
        st_point_z: '',
        st_point_m: '',
        st_point_z_m: '',
        st_polygon: '',
        st_polygon_z: '',
        st_polygon_m: '',
        st_polygon_z_m: '',
        st_geography: '',
        st_geometry: '',
        st_geometry_z: '',
        st_geometry_m: '',
        st_geometry_z_m: '',
        st_geometry_collection: '',
        st_line_string: '',
        st_line_string_z: '',
        st_line_string_m: '',
        st_line_string_z_m: '',
        st_multi_line_string: '',
        st_multi_point: '',
        st_multi_point_z: '',
        st_multi_point_m: '',
        st_multi_point_z_m: '',
        st_multi_polygon: '',
        st_multi_polygon_z: '',
        st_multi_polygon_m: '',
        st_multi_polygon_z_m: ''
    }

    def initialize_type_map(type_map)
      super
      load_spatial_types(type_map)
    end

    def load_spatial_types(m)
      m.register_type('geometry') { |_, _, sql_type| OID::STGeometry.new(sql_type) }
      m.register_type('geography') { |_, _, sql_type| OID::STGeography.new(sql_type) }
    end

    def spatial_database_types
      SPATIAL_DATABASE_TYPES
    end

    include PostGIS::SchemaStatements
    include PostGIS::CommonAdapterMethods

    private

    def create_table_definition(name, temporary, options, as = nil)
      PostGIS::TableDefinition.new(native_database_types, name, temporary, options, as)
    end
  end
end

ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.prepend ActiveRecord::PostGIS
ActiveRecord::SchemaDumper.ignore_tables += %w[geometry_columns spatial_ref_sys layer topology]
