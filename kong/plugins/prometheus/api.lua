local Schema = require("kong.db.schema")
local prometheus = require "kong.plugins.prometheus.exporter"

local empty_schema = Schema.new({ fields = {} })

return {

  ["/metrics"] = {
    schema = empty_schema,
    methods = {
      GET = function()
        prometheus.collect()
      end,
    },
  },
}
