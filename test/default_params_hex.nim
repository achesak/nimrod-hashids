import tables
import unicode
import unittest

import test_helper

import ../hashids


const map = {
    "wpVL4j9g": "deadbeef",
    "kmP69lB3xv": "abcdef123456",
    "47JWg0kv4VU0G2KBO2": "ABCDDD6666DDEEEEEEEEE",
    "y42LW46J9luq3Xq9XMly": "507f1f77bcf86cd799439011",
    "m1rO8xBQNquXmLvmO65BUO9KQmj": "f00000fddddddeeeee4444444ababab",
    "wBlnMA23NLIQDgw7XxErc2mlNyAjpw": "abcdef123456abcdef123456abcdef123456",
    "VwLAoD9BqlT7xn4ZnBXJFmGZ51ZqrBhqrymEyvYLIP199": "f000000000000000000000000000000000000000000000000000f",
    "nBrz1rYyV0C0XKNXxB54fWN0yNvVjlip7127Jo3ri0Pqw": "fffffffffffffffffffffffffffffffffffffffffffffffffffff"
}.toTable


suite "encode/decode hex using default params":
    
    setup:
        let hashids: Hashids = createHashids()

    test "encode using default params":
        for id, hex in pairs(map):
            let actualId: string = hashids.encodeHex(hex)
            check(id == actualId)

    test "encode and decode back correctly using default params":
        for id, hex in pairs(map):
            let actualId: string = hashids.encodeHex(hex)
            let actualHex: string  = hashids.decodeHex(actualId)

            check(hex.toLower() == actualHex)

