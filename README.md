# markdown-table-cli

> Format JSON as Markdown table on the command-line

```sh
cat data.json | md-table
```

Reads a list of objects in JSON from stdin and formats a markdown table in
such way that first object's keys become the table headers.

Powered by [`markdown-table`](https://github.com/wooorm/markdown-table).

```sh
npm install -g markdown-table-cli
```

## options

```
-c  capitalize each word in headers
-u  make headers upper case
-a  align columns according to the character (l, c, r) given for that
    respective column, in order from left to right
```

## examples

```sh
$ cat countries.json
[
  { "name": "Afghanistan", "code": "AF" },
  { "name": "Åland Islands", "code": "AX" },
  { "name": "Albania", "code": "AL" },
  ...
]

$ < countries.json | md-table
```

| name          | code |
| ------------- | ---- |
| Afghanistan   | AF   |
| Åland Islands | AX   |
| Albania       | AL   |

---

markdown-table-cli goes great with [`ramda-cli`][ramda-cli]

Given [`people.json`][people.json]:

```sh
nsa-shell> cat people.json | R \
  'filter both (.city is /^port/i), (.name is /^Dr\./)' \
  'project <[ name city mac creditcard ]>' \
  | md-table -c
```

```
| Name                  | City              | Mac               | Creditcard          |
| --------------------- | ----------------- | ----------------- | ------------------- |
| Dr. Joelle Cole       | Port Delaney      | fd:c4:ae:08:51:29 |                     |
| Dr. Braden Buckridge  | Port Alfredville  | 15:2b:c7:af:56:4c |                     |
| Dr. Jazlyn Johns      | Port Leora        | db:c8:aa:69:d8:4e | 1212-1221-1121-1234 |
| Dr. Angelo Reinger    | Port Monte        | 56:1c:c6:a2:e9:f3 |                     |
| Dr. Newton Reilly     | Port Connor       | 36:3a:b1:0d:0a:3b | 1228-1221-1221-1431 |
| Dr. Glenna Funk       | Port Hollychester | e5:e3:33:f7:f2:12 |                     |
| Dr. Howard Cole       | Port Isabellview  | f9:d0:38:e2:08:af |                     |
| Dr. May Schuppe       | Port Solonfurt    | 0f:19:84:f4:41:9c | 1234-2121-1221-1211 |
| Dr. Dwight Wintheiser | Port Shaneport    | 19:7b:12:44:ed:71 |                     |
| Dr. Kevon West        | Port Graciela     | 17:9e:a9:29:1e:63 |                     |
| Dr. Margie Steuber    | Port Reilly       | d3:ed:46:77:58:71 | 1234-2121-1221-1211 |
| Dr. Kathleen Kohler   | Port Gayleton     | db:99:70:39:39:ad | 1234-2121-1221-1211 |
```

[people.json]: https://gist.githubusercontent.com/raine/cd11686e0b8a4a43bbf6/raw/people.json
[ramda-cli]: https://github.com/raine/ramda-cli
