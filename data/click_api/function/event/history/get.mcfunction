# click_api v2.5 | event/history/get
# Son event'i storage'dan oku
# @usage: function click_api:event/history/get
# Sonuç: storage click_api:event last_event -> {type:"...", player_id:N}

data modify storage click_api:event last_event set from storage click_api:event history[0]
