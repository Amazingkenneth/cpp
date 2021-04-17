import requests
import json
url = "http://fanyi.youdao.com/translate?smartresult=dict&smartresult=rule"
data = {
    "from":"AUTO",
    "to":"AUTO",
    "smartresult":"dict",
    "client":"fanyideskweb",
    "salt":"15801391750396",
    "sign":"74bbb50b1bd6c62fbff24be5f3787e2f",
    "ts":"1580139175039",
    "bv":"e2a78ed30c66e16a857c5b6486a1d326",
    "doctype":"json",
    "version":"2.1",
    "keyfrom":"fanyi.web",
    "action":"FY_BY_CLICKBUTTION",
}
data['i']=input() # 输入中文
head = {"User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36"}
response = requests.post(url=url,data=data,headers=head)
name = response.json()
print(name['translateResult'][0][0]['tgt'])