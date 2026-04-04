# click_api v2.0 | cmd/run
# Macro-based komut çalıştırıcı
# @usage: function click_api:cmd/run {Command:"say Hello"}
# @context: @s = komut çalıştıran entity
# @input: {Command: string}

$execute at @s run $(Command)
