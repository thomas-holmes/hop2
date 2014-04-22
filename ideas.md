Ideas
=====

### Architecture

Run as an api service explicitly.

Build the app as an API consumer

Build a gem that interfaces with it, use the gem

given shortened urls a 'path'. nest as far as you want. home depot/some campiagn/some subgrouping/etc...

Then put urls under each one, not really contained but pathing should be resolved sort of by a "starts with"


Batch creation of urls.

example:

```bash
curl -XPOST api.hop2.io/v1/short_urls -d '{
  "count": 50,
  "url": "http://amazon.com"
}'
```

response:

```json
{
  "short_codes": [
      "AbfDCf"
    , "FjdfiO"
    , "FJdofi"
    , "nvcOSd"
    ...
  ]
}
```

stats endpoints, listings, etc..

use redis to temporarily cache teh resolution of shortcode to redirect url

probably don't use a perm redirect so browsers don't cash, can't gather stats then.

redis for API rate limiting
