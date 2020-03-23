//
import 'package:flutter/material.dart';
import 'package:myapp/page/borrow/moneySchema.dart';
import '../../global_config.dart';
import '../../util/screen_utils.dart';
import 'confirm_info.dart';

class CheckBorrowPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _CheckBorrowState();
  }
}


class _CheckBorrowState extends State<CheckBorrowPage>{
  double Scwidth = ScreenUtils.getInstance().screenWidth;
  int amount;

  bool agree=false;

  setAmount(m){
    amount = m;
  }


  @override
  Widget build(BuildContext context){
    MoneySchema moneySchema = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: new AppBar(
        title: new Text("确认借款信息",style: TextStyle(color: Colors.black45),),
        backgroundColor: GlobalConfig.TabbarColor,
//        backgroundColor: Colors.white,
      ),
      body: new SafeArea(
          child:Column(
            children: <Widget>[
              new Container(
            margin: EdgeInsets.all(20),
            width: Scwidth-40,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
//                border: Border(bottom: BorderSide(width: 1,color: Color(0xFFFF7F7F7F))),
                image: DecorationImage(
                    image: NetworkImage("https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2726034926,4129010873&fm=26&gp=0.jpg"),
                    fit: BoxFit.fill
                )
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center ,
                    verticalDirection: VerticalDirection.down ,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("借款金额（元）",style: TextStyle(fontSize: 16),)
                    ],
                  ),
                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center ,
                    verticalDirection: VerticalDirection.down ,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(moneySchema.amount.toString(),style: TextStyle(fontSize: 40),)
                    ],
                  ),
                ],
              ),
            ),
          ),
              new Container(
                padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
//                color:
                margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("借款信息")
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Row(
                        children: <Widget>[
                          Text("到期还款时间",style: TextStyle(fontSize: 13,color: Color(0xffaaaaaa)),),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("2019.11.11"),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Row(
                        children: <Widget>[
                          Text("借款期限",style: TextStyle(fontSize: 13,color: Color(0xffaaaaaa)),),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("30天"),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Row(
                        children: <Widget>[
                          Text("到期还款金额",style: TextStyle(fontSize: 13,color: Color(0xffaaaaaa)),),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("2019.12元"),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Row(
                        children: <Widget>[
                          Text("借款用途",style: TextStyle(fontSize: 13,color: Color(0xffaaaaaa)),),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("个人日常消费"),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Row(
                        children: <Widget>[
                          Text("收款账户",style: TextStyle(fontSize: 13,color: Color(0xffaaaaaa)),),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("招商银行（0909）"),
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      activeColor: Colors.green,
                      tristate: false,
                      value: agree,
                      onChanged: (bool bol){
                        this.setState((){this.agree = bol;});
                      },
                    ),
                    Text("我已阅读同意"),
                    RawMaterialButton(
                      child: Text('《来花呗使用协议》',style: TextStyle(color: Colors.blue),),
                      onPressed: (){},
                    )
                  ],
                ),
              ),
              ButtonTheme(
//                    buttonColor:Colors.green,
                minWidth: Scwidth-40,
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: FlatButton(
                  child: Text("立即拿钱",style: TextStyle(color: agree?Colors.white:Color(0xff567eff)),),
                  color: Color(0xff3641b7),
                  disabledColor: Color(0xffd9e2f5),
                  disabledTextColor: Color(0xff3641b7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  onPressed: agree?(){
                    Navigator.push(context, MaterialPageRoute(builder: (context){return ConfirmInfoPage();}));
                  }:null,

//                    padding: ,
                ),
              ),
              Text('最快1分钟到账',style: TextStyle(color: Colors.blue,fontSize: 12),),
            ],
          )
      ),
    );
  }
}