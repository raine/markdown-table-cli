require! {JSONStream, 'through2-map', minimist, fs, path}
require! 'markdown-table': table

argv = minimist process.argv.slice(2),
    string: \a, boolean: <[ u c ]>, alias: h: \help

if argv.help
    return fs.create-read-stream path.join __dirname, '../bin/usage.txt'
        .pipe process.stdout

props = (ks, obj) --> [obj[k] for k in ks]
identity = -> it
capitalize-words = (.replace /(^|[^a-zA-Z\u00C0-\u017F'])([a-zA-Z\u00C0-\u017F])/g, (.to-upper-case!))

format-table = (objs, opts) ->
    keys = Object.keys objs.0
    head = keys.map switch
    | opts.c    => capitalize-words
    | opts.u    => (.to-upper-case!)
    | otherwise => identity
    table ([head] ++ objs.map props keys),
        align: opts.a?.match /[lrc]/g

process.stdin
    .pipe JSONStream.parse!
    .pipe through2-map.obj (format-table >> (+ \\n)) _, argv
    .pipe process.stdout
