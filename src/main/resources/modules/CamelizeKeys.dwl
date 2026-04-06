%dw 2.0
import * from dw::core::Strings

fun camelizeData(data) = 
	data map ((item) -> 
	  item mapObject ((value, key) -> {
	    (camelize(key)): value
	  })
	)