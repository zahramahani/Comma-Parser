MODULES = comma_parser
EXTENSION = comma_parser
DATA = comma_parser--0.0.1.sql

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
