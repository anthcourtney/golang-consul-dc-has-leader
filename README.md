# golang-consul-dc-has-leader

Plugin for consul-template which determines whether a datacenter has a cluster leader.

## Build

```
$ make go
```

should result in a ```bin/dc-has-leader``` binary suitable for glibc OSes.

```
$ make alpine
```

should result in a ```bin/alpine/dc-has-leader``` binary suitable for musl libc OSes (i.e. alpine).

## Example invocation

```
$ CONSUL_ADDR=consul:8500 bin/dc-has-leader dc1
```

If the dc has a leader, it will print the string "true", otherwise it will quietly exit. The intent is that the plugin output is piped to consul-template's ```parseBool``` filter.

For example:

```
{{ range $dc := datacenters -}}
{{ if plugin "bin/dc-has-leader" $dc | parseBool -}}
dc: {{ $dc }}
{{- end -}}
{{- end -}}
```

See https://github.com/anthcourtney/consul-template-dc-failure for an example of using this plugin in a multi-datacenter environment where one of the queried datacenters loses consensus.
