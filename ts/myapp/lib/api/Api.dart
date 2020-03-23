class Api {
  static final String host = "http://10.1.1.61:3005";
//  static final String host = "http://10.1.14.23:8080";

  static final String newsDetail = host + "/action/openapi/news_detail";

  static final String local = "https://localhost:9999";

  static final String isPhoneExists= "/api/user/isPhoneExists.htm";

  static final String banner = "/api/adver/banner.htm"; //banner图

  static final String index = "/api/borrow/findIndex.htm"; //index数据

  static final String noticelist = "/api/borrow/listIndex.htm"; //小喇叭

  static final String findAll = "/api/act/borrow/findAll.htm"; //

  static final String userInfo = "/api/act/user/info.htm";

  static final String choicesList = "/api/borrow/choicesList.htm";

  static final String h5list = "/api/h5/list.htm";

  static final String borrowlog = "/api/act/mine/borrow/page.htm"; //借款记录

  static final String borrowdetail = "/api/act/mine/borrow/findProgress.htm"; //借款详情
}