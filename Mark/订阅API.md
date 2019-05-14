### 交易员订阅

- 接口地址：/api/ExchgSubscribeTradeApi/GetTraderSubscribeInfos
- 返回格式：json
- 请求方式：POST
- 请求示例：http://192.168.3.13:8989/api/ExchgSubscribeTradeApi/GetTraderSubscribeInfos
- 接口备注：
- 请求参数说明：

| 名称        | 类型   | 必填  | 说明       | 备注 |
| ----------- | ------ | ----- | ---------- | ---- |
| CompanyCode | String | false | 交易商代码 |      |
| TraderCode  | String | false | 交易员代码 |      |
| Types       | Array  | false | 业务类型   |      |

- 返回参数说明：

| 名称                         | 类型   | 说明         |
| ---------------------------- | ------ | ------------ |
| IsSuccess                    | Bool   | 成功失败     |
| Message                      | String | 失败信息     |
| Value                        | Array  |              |
| Value[0].Agency              | Object | 交易商信息   |
| Value[0].Agency.Abbreviation | String | 机构名称拼音 |
| Value[0].Agency.CompanyCode  | String | 机构代码     |
| Value[0].Agency.ContactsMan  | String | 联系人       |
| Value[0].Agency.CreatedTime  | String | 创建时间     |
| Value[0].Agency.CreatedUser  | String | 创建人       |
| Value[0].Agency.DeleteFlag   | Bool   | 删除标记     |
| Value[0].Agency.Fax          | String | 传真         |
| Value[0].Agency.IID          | Number | IID          |
| Value[0].Agency.Market       | Number | 交易所       |
| Value[0].Agency.Name         | String | 机构名称     |
| Value[0].Agency.Phone        | String | 手机号码     |
| Value[0].Agency.ShortName    | String | 机构简称     |
| Value[0].Agency.UpdateTime   | String | 更新时间     |
| Value[0].Agency.UpdateUser   | String | 更新人       |
| Value[0].CompanyCode         | String | 机构代码     |
| Value[0].IID                 | String | IID          |
| Value[0].Status              | String | 订阅状态     |
| Value[0].StatusDesc          | String | 订阅状态描述 |
| Value[0].Trader              | Object | 交易员信息   |
| Value[0].Trader.CompanyCode  | String | 交易商代码   |
| Value[0].Trader.CreatedTime  | String | 创建时间     |
| Value[0].Trader.CreatedUser  | String | 创建人       |
| Value[0].Trader.DeleteFlag   | Bool   | 删除标记     |
| Value[0].Trader.IID          | Number | IID          |
| Value[0].Trader.TraderCode   | String | 交易员代码   |
| Value[0].Trader.TraderName   | String | 交易员名称   |
| Value[0].Trader.UpdateTime   | String | 更新时间     |
| Value[0].Trader.UpdateUser   | String | 更新人       |
| Value[0].TraderCode          | String | 交易员代码   |
| Value[0].Types               | Array  | 业务类型     |

- JSON返回示例：

  ```json
  {
      IsSuccess: true
      Message: "成功"
      Value: [
          0: {
              Agency: {
                  Abbreviation: "tlzq"
                  CompanyCode: "277"
                  ContactsMan: ""
                  CreatedTime: null
                  CreatedUser: null
                  DeleteFlag: false
                  Fax: ""
                  IID: 1
                  Market: 3
                  Name: "天龙证券"
                  Phone: ""
                  ShortName: "天龙证券"
                  UpdateTime: "2019-04-23 08:39:14"
                  UpdateUser: "Administrator"
              }
              CompanyCode: "277"
              IID: "221"
              Status: "success"
              StatusDesc: "成功"
              Trader: {
                  CompanyCode: "277"
                  CreatedTime: null
                  CreatedUser: null
                  DeleteFlag: false
                  IID: 4
                  TraderCode: "Z27700"
                  TraderName: "李四"
                  UpdateTime: "2019-04-22 11:11:09"
                  UpdateUser: "Administrator"
              }
              TraderCode: "Z27700"
              Types: [
                  0: "交易员信息订阅"
              ]
          }
      ]
  }
  ```



---

### 交易员订阅-取消订阅

- 接口地址：/api/ExchgSubscribeTradeApi/UnsubscribeTrader
- 返回格式：json
- 请求方式：POST
- 请求示例：http://192.168.3.13:8989/api/ExchgSubscribeTradeApi/UnsubscribeTrader
- 接口备注：
- 请求参数说明：

| 名称              | 类型  | 必填 | 说明 | 备注 |
| ----------------- | ----- | ---- | ---- | ---- |
| UnscribeRecordIds | Array | true | IID  |      |

- 返回参数说明：

| 名称      | 类型   | 说明     |
| --------- | ------ | -------- |
| IsSuccess | Bool   | 成功失败 |
| Message   | String | 失败信息 |
| Value     |        | null     |

- JSON返回示例：

  ```json
  {
      IsSuccess: true
      Message: "成功"
      Value: null
  }
  ```

---



### 交易员订阅-订阅

- 接口地址：/api/ExchgSubscribeTradeApi/SubscribeTrader
- 返回格式：json
- 请求方式：POST
- 请求示例：http://192.168.3.13:8989/api/ExchgSubscribeTradeApi/SubscribeTrader
- 接口备注：
- 请求参数说明：

| 名称        | 类型   | 必填 | 说明       | 备注 |
| ----------- | ------ | ---- | ---------- | ---- |
| CompanyCode | String | true | 交易商代码 |      |
| TraderCode  | String | true | 交易员代码 |      |
| Types       | Array  | true | 业务类型   |      |

- 返回参数说明：

| 名称      | 类型   | 说明     |
| --------- | ------ | -------- |
| IsSuccess | Bool   | 成功失败 |
| Message   | String | 失败信息 |

- JSON返回示例：

  ```json
  {
      IsSuccess: true
      Message: "成功"
  }
  ```

------



### 交易通道订阅

- 接口地址：/api/ExchgSubscribeTradeApi/GetStatusSubscribeInfos
- 返回格式：json
- 请求方式：POST
- 请求示例：http://192.168.3.13:8989/api/ExchgSubscribeTradeApi/GetStatusSubscribeInfos
- 接口备注：
- 请求参数说明：

| 名称      | 类型   | 必填  | 说明     | 备注 |
| --------- | ------ | ----- | -------- | ---- |
| Channel   | String | false | 交易通道 |      |
| BusiTypes | Array  | false | 业务类型 |      |

- 返回参数说明：

| 名称                           | 类型   | 说明         |
| ------------------------------ | ------ | ------------ |
| IsSuccess                      | Bool   | 成功失败     |
| Message                        | String | 失败信息     |
| Value                          | Array  |              |
| Value[0].BusiName              | String | 交易商信息   |
| Value[0].Channel               | String | 交易通道代码 |
| Value[0].ChannelName           | String | 交易通道名称 |
| Value[0].IID                   | String | IID          |
| Value[0].Status                | String | 订阅状态     |
| Value[0].StatusDesc            | String | 订阅状态描述 |
| Value[0].SubscribeTypeCfgInfos | String | 业务类型代码 |

- JSON返回示例：

  ```json
  {
      IsSuccess: true
      Message: "成功"
      Value: [
          0: { 
              BusiName: "交易通道状态订阅"
              Channel: "SZSE"
              ChannelName: "深交所"
              IID: "212"
              Status: "success"
              StatusDesc: "成功"
              SubscribeTypeCfgInfos: null
          }
      ]
  }
  ```



------

### 交易通道订阅-取消订阅

- 接口地址：/api/ExchgSubscribeTradeApi/UnsubscribeStatus
- 返回格式：json
- 请求方式：POST
- 请求示例：http://192.168.3.13:8989/api/ExchgSubscribeTradeApi/UnsubscribeStatus
- 接口备注：
- 请求参数说明：

| 名称              | 类型  | 必填 | 说明 | 备注 |
| ----------------- | ----- | ---- | ---- | ---- |
| UnscribeRecordIds | Array | true | IID  |      |

- 返回参数说明：

| 名称      | 类型   | 说明     |
| --------- | ------ | -------- |
| IsSuccess | Bool   | 成功失败 |
| Message   | String | 失败信息 |
| Value     |        | null     |

- JSON返回示例：

  ```json
  {
      IsSuccess: true
      Message: "成功"
      Value: null
  }
  ```

------



### 交易通道订阅-订阅

- 接口地址：/api/ExchgSubscribeTradeApi/SubscribeStatus
- 返回格式：json
- 请求方式：POST
- 请求示例：http://192.168.3.13:8989/api/ExchgSubscribeTradeApi/SubscribeStatus
- 接口备注：
- 请求参数说明：

| 名称      | 类型   | 必填 | 说明     | 备注 |
| --------- | ------ | ---- | -------- | ---- |
| Channel   | String | true | 交易通道 |      |
| busiTypes | Array  | true | 业务类型 |      |
| Type      | String | true | 订阅类型 |      |

- 返回参数说明：

| 名称      | 类型   | 说明     |
| --------- | ------ | -------- |
| IsSuccess | Bool   | 成功失败 |
| Message   | String | 失败信息 |

- JSON返回示例：

  ```json
  {
      IsSuccess: true
  	Message: "成功"
  }
  ```

------







