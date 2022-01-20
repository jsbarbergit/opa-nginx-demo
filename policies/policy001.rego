package opa.access.proxy


# List of whitelisted websites - needs externalising
url_whitelist := {
  "localhost/proxy/allowed",
  "localhost/proxy",
}

# Set authz var values - clients should request this var for policy decision response 
authz["reason"] = "Authorised" { allowed }
authz["reason"] = sprintf("URL: %v is not whitelisted", [input["X-Original-Referer"]]) { not allowed }
authz["code"] = 200 { allowed }
authz["code"] = 403 { not allowed }


allowed {
  some i
    input["X-Original-Referer"] == url_whitelist[i]
}