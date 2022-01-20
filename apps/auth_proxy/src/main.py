from flask import Flask, Response, request, make_response, jsonify
import os, requests, json

# Flask vars & funcs
FLASK_PORT=os.environ.get("FLASK_PORT", 8181)
authz_path = '/v1/data/'
health_path = '/health'
OPA_URL = os.environ.get("OPA_URL", "http://opa:8181")
app = Flask(__name__)

# Flask Routing
@app.route('/')
def root():
  return 'Authz calls are served on <a href=http://' + request.host + authz_path + '>' + authz_path + '</a>. <br />Add a specific policy package path suffix or else all policies will be evaluated for the request'

@app.route(health_path)
def test():
    return 'Healthy', 200

# any path that starts with /v1/data is destined for an OPA check
@app.route(authz_path + '<path:policypath>')
def authz(policypath):
  payload = {'input': {}}
  for h in request.headers :
    payload["input"][h[0]] = h[1]
  decision = check_authz(policypath, json.dumps(payload))
  status = 500
  content = ""
  # Evaluate content for values once you have the json returned  
  if decision.status_code != 200:
    content = "Received invalid status from OPA server: " + str(decision.status_code)
  else:
    if "code" in decision.json()["result"] :
      status = decision.json()["result"]["code"]
    if "reason" in decision.json()["result"] :
      content = decision.json()["result"]["reason"]
  response = make_response(content, status)
  response.headers['X-Authz-Reason'] = content
  response.headers['X-Authz-Code'] = status
  return response

def check_authz(policypath, payload) :
  print(payload)
  url = OPA_URL + authz_path + policypath
  if not policypath.startswith("/") :
    policypath = "/" + policypath
  headers = {
    'Content-Type': 'application/json',
    'Accept': '*/*'
  }
  resp = requests.post(url, headers=headers, data=payload)
  return resp

# Entrypoint
if __name__ == "__main__":
  # Override default global vars from env vars if they exist
  if 'FLASK_PORT' in os.environ:
    FLASK_PORT = os.getenv('FLASK_PORT')
  # start the app on given port
  app.run(port=FLASK_PORT)