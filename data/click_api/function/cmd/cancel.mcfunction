# click_api v2.5 | cmd/cancel
# Komut kuyruğundan belirli bir komutu iptal et
#
# @usage - index ile (0-bazlı):
#   function click_api:cmd/cancel {index:0}
#
# @usage - tümünü temizle:
#   function click_api:api/queue_clear

$data remove storage click_api:cmd queue[$(index)]
