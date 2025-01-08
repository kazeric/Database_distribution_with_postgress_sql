ALTER SYSTEM SET logging_collector = 'on';

-- Enable logging for all statements
ALTER SYSTEM SET log_statement = 'all';

-- Set the log directory (optional, depends on your PostgreSQL setup)
ALTER SYSTEM SET log_directory = 'pg_log';

-- Set the logging level
ALTER SYSTEM SET log_min_messages = 'info';

-- Set the logging format (optional)
ALTER SYSTEM SET log_line_prefix = '%m [%p] %d %u %r %a: ';

SELECT pg_reload_conf();

SHOW log_directory;
SHOW data_directory;
SHOW log_filename;
SHOW logging_collector;
