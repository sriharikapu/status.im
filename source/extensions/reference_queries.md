---
id: reference_queries
title: Extension Reference - Queries
---

# Queries in Extensions

A query is defined by a name and an optional map of arguments.

# Queries

| Symbol             | Arguments               |
| -------------      | -------------           |
| store/get          | key :string             |

Example usage:

```clojure
(let [{name :name} [store/get {:key "some-key"}]]
  [text name])
```