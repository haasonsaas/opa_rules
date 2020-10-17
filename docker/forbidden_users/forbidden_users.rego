package docker.forbidden_users.forbidden_users
# ... but do not root
forbidden_users = [
    "root",
    "toor",
    "0"
]

deny[msg] {
    input[i].Cmd == "user"
    val := input[i].Value
    contains(lower(val[_]), forbidden_users[_])
    msg = sprintf("Line %d: Do not run as root: %s", [i, val])
}
