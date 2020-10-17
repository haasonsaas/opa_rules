package docker.system_package_upgrade.system

# Do not upgrade your system packages
upgrade_commands = [
    "apk upgrade",
    "apt-get upgrade",
    "dist-upgrade",
]

deny[msg] {
    input[i].Cmd == "run"
    val := concat(" ", input[i].Value)
    contains(val, upgrade_commands[_])
    msg = sprintf("Line: %d: Do not upgrade your system packages", [i])
}
