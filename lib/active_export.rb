require "active_export/version"

module ActiveExport
  autoload :JsonExport, 'active_export/json_export'
  include JsonExport
end
