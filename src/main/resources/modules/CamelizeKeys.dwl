%dw 2.0
import * from dw::core::Strings
output application/json
---
payload map ((item) -> 
  item mapObject ((value, key) -> {
    (camelize(key)): value
  })
)