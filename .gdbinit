set unwindonsignal on
set history save

define savebp
save breakpoints .gdb_bps
end

define loadbp
source .gdb_bps
end

loadbp

set startup-with-shell off
