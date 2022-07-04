class AddFirstLastAggregateFunctions < ActiveRecord::Migration[7.0]
  def up
    # Source: https://wiki.postgresql.org/wiki/First/last_(aggregate)
    execute <<~SQL
      -- Create a function that always returns the first non-NULL value:
      CREATE OR REPLACE FUNCTION public.first_agg(anyelement, anyelement)
        RETURNS anyelement
        LANGUAGE sql IMMUTABLE STRICT PARALLEL SAFE AS
      'SELECT $1';

      -- Then wrap an aggregate around it:
      CREATE AGGREGATE public.first(anyelement) (
        SFUNC    = public.first_agg,
        STYPE    = anyelement,
        PARALLEL = safe
      );

      -- Create a function that always returns the last non-NULL value:
      CREATE OR REPLACE FUNCTION public.last_agg(anyelement, anyelement)
        RETURNS anyelement
        LANGUAGE sql IMMUTABLE STRICT PARALLEL SAFE AS
      'SELECT $2';

      -- Then wrap an aggregate around it:
      CREATE AGGREGATE public.last(anyelement) (
        SFUNC    = public.last_agg,
        STYPE    = anyelement,
        PARALLEL = safe
      );
    SQL
  end

  def down
    execute <<~SQL
      DROP AGGREGATE public.last(anyelement);
      DROP FUNCTION public.last_agg(anyelement, anyelement);
      DROP AGGREGATE public.first(anyelement);
      DROP FUNCTION public.first_agg(anyelement, anyelement);
    SQL
  end
end
