# golang-consul-dc-has-leader

Plugin for consul-template which determines whether a datacenter has a cluster leader.

## Build

```
$ make
```

should result in a ```bin/dc-has-leader```

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
