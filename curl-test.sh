curl -X POST http://127.0.0.1:8181/v1/data/opa/access/proxy/authz -H 'Content-Type: application/json' -d '{"Host": "127.0.0.1:8182", "Connection": "keep-alive", "Pragma": "no-cache", "Cache-Control": "no-cache", "Sec-Ch-Ua": "\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"96\", \"Google Chrome\";v=\"96\"", "Sec-Ch-Ua-Mobile": "?0", "Sec-Ch-Ua-Platform": "\"macOS\"", "Upgrade-Insecure-Requests": "1", "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36", "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9", "Sec-Fetch-Site": "none", "Sec-Fetch-Mode": "navigate", "Sec-Fetch-User": "?1", "Sec-Fetch-Dest": "document", "Accept-Encoding": "gzip, deflate, br", "Accept-Language": "en-GB,en-US;q=0.9,en;q=0.8", "Cookie": "R_PCS=dark; R_LOCALE=en-us; bcookie=9e32b81c-2c04-4246-909d-47008d63a312; DEFAULT_UI=NEW; argocd.token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MjQwODk1MzUsImp0aSI6ImEyNDdiNjVhLWJhYmYtNDRkOS1iZGIyLWIyZTI3NDI1ZWMyNyIsImlhdCI6MTYyNDAwMzEzNSwiaXNzIjoiYXJnb2NkIiwibmJmIjoxNjI0MDAzMTM1LCJzdWIiOiJhZG1pbjpsb2dpbiJ9.U54vXFakVCd2PyhtcbVAJBtGu8v6lJeMgXfAhN_-cbQ; JSESSIONID.b1264721=node0n76gf3ighdcq1s3980270mqj10.node0; screenResolution=1536x960"}'