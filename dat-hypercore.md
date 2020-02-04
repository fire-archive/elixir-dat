# Dat Hypercore

Create a key value database using ra.

There is a map data structure of key to feeds.

## Cryptography

Blake2b-256

https://github.com/mwmiller/blake2_ex

Signatures are ed25519 with the sha-512 hash function

https://hexdocs.pm/ed25519/Ed25519.html

> In :crypto.generate_key(:ecdh, :ed25519) ecdh refers to all kinds of eliptic curves and then we use x25519. While in :crypto.sign(:eddsa, :sha256, msg, [priv_key, :ed25519]) we have special function for Edwards curves, in which we use ed25519.

https://elixirforum.com/t/library-for-ed25519-signatures/26668/8

## References

https://github.com/mafintosh/hypercore

https://www.datprotocol.com/deps/0002-hypercore/

https://datatracker.ietf.org/doc/rfc7574/?include_text=1 "Bin Numbers"

https://github.com/rabbitmq/ra-kv-store

