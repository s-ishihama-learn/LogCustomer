<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<bean:define id="title"><bean:message key="title.report.edit" /></bean:define><!-- 顧客日報編集 -->

<html:html>
<head>
<jsp:include page="../common/header.jsp">
  <jsp:param name="title" value="<%=title%>"></jsp:param>
</jsp:include>
<link rel="stylesheet" type="text/css" href="css/header2.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
</head>

<body>
  <div class="container">
    <jsp:include page="../common/header2.jsp" />
    <h3 class="page-header"><bean:message key="title.report.edit" /></h3><!-- 顧客日報編集 -->

    <html:form action="/EditReport" method="post" styleClass="form-horizontal">
      <div class="form-group">
        <label class="col-sm-3 control-label"><bean:message key="editSchedule.name" /></label><!-- 社員名 -->
        <div class="col-sm-6">
          <html:text property="userName" styleClass="form-control" readonly="true" />
        </div>
        <div class="col-sm-3"></div>
      </div>

      <div class="form-group">
        <label class="col-sm-3 control-label"><bean:message key="item.viewDate" /></label><!-- 年月日 -->
        <div class="col-sm-6">
          <html:text property="viewDateDisp" name="CommonSession" styleClass="form-control" readonly="true" />
        </div>
        <div class="col-sm-3"></div>
      </div>

      <div class="form-group">
        <label class="col-sm-3 control-label"><bean:message key="editReport.time" /></label><!-- 対応時刻 -->
        <logic:equal property="editMode" name="CommonSession" value="true">
          <div class="col-sm-2">
           <bean:define id="haserr" value=""/>
           <logic:messagesPresent property="startTime"><%haserr="has-error";%></logic:messagesPresent>
            <div class="input-group <%=haserr%>">
            <html:select property="startTime" styleClass="form-control" >
              <html:optionsCollection property="startTimeSelectBox" name="CommonSession" value="key" label="value" />
            </html:select>
            <span class="input-group-addon"><bean:message key="label.required" /></span>
            </div>
            <p class="text-danger"><html:errors property="startTime"/></p>
          </div>
          <div class="col-sm-2 text-center"><bean:message key="item.fromTo" /></div><!-- ～ -->
          <div class="col-sm-2">
           <bean:define id="haserr" value=""/>
           <logic:messagesPresent property="endTime"><%haserr="has-error";%></logic:messagesPresent>
            <div class="input-group <%=haserr%>">
            <html:select property="endTime" styleClass="form-control" >
              <html:optionsCollection property="endTimeSelectBox" name="CommonSession" value="key" label="value" />
            </html:select>
            <span class="input-group-addon"><bean:message key="label.required" /></span>
            </div>
            <p class="text-danger"><html:errors property="endTime"/></p>
          </div>
        </logic:equal>
        <logic:equal property="editMode" name="CommonSession" value="false">
          <div class="col-sm-2">
            <html:select property="startTime" styleClass="form-control" disabled ="true">
              <html:optionsCollection property="startTimeSelectBox" name="CommonSession" value="key" label="value" />
            </html:select>
            <html:hidden property="startTime" />
          </div>
          <div class="col-sm-1 text-center"><bean:message key="item.fromTo" /></div><!-- ～ -->
          <div class="col-sm-2">
            <html:select property="endTime" styleClass="form-control" disabled ="true">
              <html:optionsCollection property="endTimeSelectBox" name="CommonSession" value="key" label="value" />
            </html:select>
            <html:hidden property="endTime" />
          </div>
        </logic:equal>
        <div class="col-sm-3"></div>
      </div>

      <div class="form-group">
        <label class="col-sm-3 control-label"><bean:message key="editReport.useTime" /></label><!-- 処理時間 -->
        <logic:equal property="editMode" name="CommonSession" value="true">
          <div class="col-sm-2">
            <h6><bean:message key="editReport.beforeTime" /></h6><!-- 訪問準備 -->
           <bean:define id="haserr" value=""/>
           <logic:messagesPresent property="beforeTime"><%haserr="has-error";%></logic:messagesPresent>
            <div class="input-group <%=haserr%>">
            <html:text property="beforeTime" maxlength="5" styleClass="form-control" />
            <span class="input-group-addon"><bean:message key="label.required" /></span>
            </div>
            <p class="text-danger"><html:errors property="beforeTime"/></p>
          </div>
          <div class="col-sm-2">
            <h6><bean:message key="editReport.moveTime" /></h6><!-- 移動時間 -->
           <bean:define id="haserr" value=""/>
           <logic:messagesPresent property="moveTime"><%haserr="has-error";%></logic:messagesPresent>
            <div class="input-group <%=haserr%>">
            <html:text property="moveTime" maxlength="5" styleClass="form-control" />
            <span class="input-group-addon"><bean:message key="label.required" /></span>
            </div>
            <p class="text-danger"><html:errors property="moveTime"/></p>
          </div>
          <div class="col-sm-2">
            <h6><bean:message key="editReport.afterTime" /></h6><!-- 訪問後処理 -->
           <bean:define id="haserr" value=""/>
           <logic:messagesPresent property="afterTime"><%haserr="has-error";%></logic:messagesPresent>
            <div class="input-group <%=haserr%>">
            <html:text property="afterTime" maxlength="5" styleClass="form-control" />
            <span class="input-group-addon"><bean:message key="label.required" /></span>
            </div>
            <p class="text-danger"><html:errors property="afterTime"/></p>
          </div>
        </logic:equal>
        <logic:equal property="editMode" name="CommonSession" value="false">
          <div class="col-sm-2">
            <h6><bean:message key="editReport.beforeTime" /></h6><!-- 訪問準備 -->
            <html:text property="beforeTime" maxlength="5" styleClass="form-control" readonly="true" />
          </div>
          <div class="col-sm-2">
            <h6><bean:message key="editReport.moveTime" /></h6><!-- 移動時間 -->
            <html:text property="moveTime" maxlength="5" styleClass="form-control" readonly="true" />
          </div>
          <div class="col-sm-2">
            <h6><bean:message key="editReport.afterTime" /></h6><!-- 訪問後処理 -->
            <html:text property="afterTime" maxlength="5" styleClass="form-control" readonly="true" />
          </div>
        </logic:equal>
        <div class="col-sm-3"></div>
      </div>

      <div class="form-group">
        <label class="col-sm-3 control-label"><bean:message key="editReport.reportType" /></label><!-- 日報分類 -->
        <div class="col-sm-6">
          <logic:equal property="editMode" name="CommonSession" value="true">
           <bean:define id="haserr" value=""/>
           <logic:messagesPresent property="reportType"><%haserr="has-error";%></logic:messagesPresent>
            <div class="input-group <%=haserr%>">
            <html:select property="reportType" styleClass="form-control">
              <html:optionsCollection property="typeSelectBox" name="CommonSession" value="key" label="value" />
            </html:select>
            <span class="input-group-addon"><bean:message key="label.required" /></span>
            </div>
            <p class="text-danger"><html:errors property="reportType"/></p>
          </logic:equal>
          <logic:equal property="editMode" name="CommonSession" value="false">
            <html:select property="reportType" styleClass="form-control" disabled ="true">
              <html:optionsCollection property="typeSelectBox" name="CommonSession" value="key" label="value" />
            </html:select>
            <html:hidden property="reportType"/>
          </logic:equal>
        </div>
        <div class="col-sm-3"></div>
      </div>

      <div class="form-group">
        <label class="col-sm-3 control-label"><bean:message key="editReport.title" /></label><!-- タイトル -->
        <div class="col-sm-6">
          <logic:equal property="editMode" name="CommonSession" value="true">
           <bean:define id="haserr" value=""/>
           <logic:messagesPresent property="title"><%haserr="has-error";%></logic:messagesPresent>
            <div class="input-group <%=haserr%>">
            <html:text property="title" maxlength="100" styleClass="form-control" />
            <span class="input-group-addon"><bean:message key="label.required" /></span>
            </div>
            <p class="text-danger"><html:errors property="title"/></p>
          </logic:equal>
          <logic:equal property="editMode" name="CommonSession" value="false">
            <html:text property="title" maxlength="100" styleClass="form-control" readonly="true" />
          </logic:equal>
        </div>
        <div class="col-sm-3"></div>
      </div>

      <div class="form-group">
        <label class="col-sm-3 control-label"><bean:message key="editReport.custName" /></label><!-- 顧客名 -->
        <div class="col-sm-6">
          <logic:equal property="editMode" name="CommonSession" value="true">
           <bean:define id="haserr" value=""/>
           <logic:messagesPresent property="custName"><%haserr="has-error";%></logic:messagesPresent>
            <div class="input-group <%=haserr%>">
            <html:text property="custName" maxlength="100" styleClass="form-control" />
            <span class="input-group-addon"><bean:message key="label.required" /></span>
            </div>
            <p class="text-danger"><html:errors property="custName"/></p>
          </logic:equal>
          <logic:equal property="editMode" name="CommonSession" value="false">
            <html:text property="custName" maxlength="100" styleClass="form-control" readonly="true" />
          </logic:equal>
        </div>
        <div class="col-sm-3"></div>
      </div>

      <div class="form-group">
        <label class="col-sm-3 control-label"><bean:message key="editReport.custDept" /></label><!-- 顧客部署名 -->
        <div class="col-sm-6">
          <logic:equal property="editMode" name="CommonSession" value="true">
            <html:text property="custDept" maxlength="100" styleClass="form-control" />
          </logic:equal>
          <logic:equal property="editMode" name="CommonSession" value="false">
            <html:text property="custDept" maxlength="100" styleClass="form-control" readonly="true" />
          </logic:equal>
        </div>
        <div class="col-sm-3"></div>
      </div>

      <div class="form-group">
        <label class="col-sm-3 control-label"><bean:message key="editReport.custUser" /></label><!-- 顧客担当者名 -->
        <div class="col-sm-6">
          <logic:equal property="editMode" name="CommonSession" value="true">
            <html:text property="custUserName" maxlength="100" styleClass="form-control" />
          </logic:equal>
          <logic:equal property="editMode" name="CommonSession" value="false">
            <html:text property="custUserName" maxlength="100" styleClass="form-control" readonly="true" />
          </logic:equal>
        </div>
        <div class="col-sm-3"></div>
      </div>

      <div class="form-group">
        <label class="col-sm-3 control-label"><bean:message key="editReport.fact" /></label><!-- 事実 -->
        <div class="col-sm-6">
          <logic:equal property="editMode" name="CommonSession" value="true">
           <bean:define id="haserr" value=""/>
           <logic:messagesPresent property="fact"><%haserr="has-error";%></logic:messagesPresent>
            <div class="input-group <%=haserr%>">
            <html:textarea property="fact" rows="3" styleClass="form-control" />
            <span class="input-group-addon"><bean:message key="label.required" /></span>
            </div>
            <p class="text-danger"><html:errors property="fact"/></p>
          </logic:equal>
          <logic:equal property="editMode" name="CommonSession" value="false">
            <html:textarea property="fact" rows="3" styleClass="form-control" readonly="true" />
          </logic:equal>
        </div>
        <div class="col-sm-3"></div>
      </div>

      <div class="form-group">
        <label class="col-sm-3 control-label"><bean:message key="editReport.guess" /></label><!-- 推察 -->
        <div class="col-sm-6">
          <logic:equal property="editMode" name="CommonSession" value="true">
           <bean:define id="haserr" value=""/>
           <logic:messagesPresent property="guess"><%haserr="has-error";%></logic:messagesPresent>
            <div class="input-group <%=haserr%>">
            <html:textarea property="guess" rows="3" styleClass="form-control" />
            <span class="input-group-addon"><bean:message key="label.required" /></span>
            </div>
            <p class="text-danger"><html:errors property="guess"/></p>
          </logic:equal>
          <logic:equal property="editMode" name="CommonSession" value="false">
            <html:textarea property="guess" rows="3" styleClass="form-control" readonly="true" />
          </logic:equal>
        </div>
        <div class="col-sm-3"></div>
      </div>

      <div class="form-group">
        <label class="col-sm-3 control-label"><bean:message key="editReport.next" /></label><!-- 次回 -->
        <div class="col-sm-6">
          <logic:equal property="editMode" name="CommonSession" value="true">
           <bean:define id="haserr" value=""/>
           <logic:messagesPresent property="next"><%haserr="has-error";%></logic:messagesPresent>
            <div class="input-group <%=haserr%>">
            <html:textarea property="next" rows="3" styleClass="form-control" />
            <span class="input-group-addon"><bean:message key="label.required" /></span>
            </div>
            <p class="text-danger"><html:errors property="next"/></p>
          </logic:equal>
          <logic:equal property="editMode" name="CommonSession" value="false">
            <html:textarea property="next" rows="3" styleClass="form-control" readonly="true" />
          </logic:equal>
        </div>
        <div class="col-sm-3"></div>
      </div>


      <logic:equal property="viewMode" name="EditReportForm" value="3">
        <div class="form-group">
          <label class="col-sm-3 control-label"><bean:message key="editReport.comment.approval" /></label><!-- 承認コメント -->
          <div class="col-sm-6">
           <bean:define id="haserr" value=""/>
           <logic:messagesPresent property="applovalMessage"><%haserr="has-error";%></logic:messagesPresent>
            <div class="input-group <%=haserr%>">
              <html:textarea property="applovalMessage" rows="3" styleClass="form-control" />
            <span class="input-group-addon"><bean:message key="label.required" /></span>
            </div>
            <p class="text-danger"><html:errors property="applovalMessage"/></p>
          </div>
          <div class="col-sm-3"></div>
        </div>

        <logic:iterate id="comment" property="commentList" name="EditReportForm">
          <div class="form-group">
            <label class="col-sm-3 control-label">
              <bean:message key="editReport.comment.to" /><br><bean:write property="commentUser" name="comment" /><bean:message key="editReport.comment.p" />
            </label><!-- コメント投稿者<br>さん -->
            <div class="col-sm-6">
              <html:textarea property="comment" name="comment" rows="3" styleClass="form-control" readonly="true" />
            </div>
            <div class="col-sm-3"></div>
          </div>
        </logic:iterate>
      </logic:equal>


      <logic:equal property="viewMode" name="EditReportForm" value="4">
        <logic:equal property="applyFlag" name="EditReportForm" value="1">
        <div class="form-group">
          <label class="col-sm-3 control-label">
            <bean:write property="applovalUser" name="EditReportForm" />
            <bean:message key="editReport.comment.p" /><br><bean:message key="editReport.comment.from" />
          </label><!-- さん<br>からの承認コメント -->
          <div class="col-sm-6">
            <logic:equal property="editMode" name="CommonSession" value="true">
           <bean:define id="haserr" value=""/>
           <logic:messagesPresent property="applovalMessage"><%haserr="has-error";%></logic:messagesPresent>
            <div class="input-group <%=haserr%>">
              <html:textarea property="applovalMessage" rows="3" styleClass="form-control" />
            <span class="input-group-addon"><bean:message key="label.required" /></span>
            </div>
            <p class="text-danger"><html:errors property="applovalMessage"/></p>
            </logic:equal>
            <logic:equal property="editMode" name="CommonSession" value="false">
              <html:textarea property="applovalMessage" rows="3" styleClass="form-control" readonly="true" />
            </logic:equal>
          </div>
          <div class="col-sm-3"></div>
        </div>
        </logic:equal>

        <logic:iterate id="comment" property="commentList" name="EditReportForm">
          <div class="form-group">
            <label class="col-sm-3 control-label">
              <bean:message key="editReport.comment.to" /><br><bean:write property="commentUser" name="comment" /><bean:message key="editReport.comment.p" />
            </label><!-- コメント投稿者<br>さん -->
            <div class="col-sm-6">
              <logic:equal property="editMode" name="CommonSession" value="true">
                <html:textarea property="comment" name="comment" rows="3" styleClass="form-control" />
              </logic:equal>
              <logic:equal property="editMode" name="CommonSession" value="false">
                <html:textarea property="comment" name="comment" rows="3" styleClass="form-control" readonly="true" />
              </logic:equal>
            </div>
            <div class="col-sm-3"></div>
          </div>
        </logic:iterate>

        <div class="form-group">
          <label class="col-sm-3 control-label"><bean:message key="editReport.comment" /></label><!-- コメント -->
          <div class="col-sm-6">
            <bean:define id="haserr" value=""/>
            <logic:messagesPresent property="commentMessage"><%haserr="has-error";%></logic:messagesPresent>
            <div class="input-group <%=haserr%>">
              <html:textarea property="commentMessage" rows="3" styleClass="form-control" />
              <span class="input-group-addon"><bean:message key="label.required" /></span>
            </div>
            <p class="text-danger"><html:errors property="commentMessage"/></p>
          </div>
          <div class="col-sm-3"></div>
        </div>
      </logic:equal>

      <html:messages id="msg" message="true"><div class="alert alert-info"><bean:write name="msg" /></div></html:messages>
      <logic:messagesPresent property="value"><div class="alert alert-danger"><html:errors property="value" /></div></logic:messagesPresent>

      <div class="form-group">
        <div class="col-sm-offset-3 col-sm-9">
          <logic:equal property="viewMode" name="EditReportForm" value="1">
            <html:button property="regist" onclick="setAction('regist');" styleClass="btn btn-primary"><bean:message key="button.regist" /></html:button><!-- 登録 -->
            <html:button property="cancel" onclick="doCancel('cancelNew');" styleClass="btn btn-default"><bean:message key="button.cancel" /></html:button><!-- キャンセル -->
          </logic:equal>
          <logic:equal property="viewMode" name="EditReportForm" value="2">
            <html:button property="edit" onclick="setAction('edit');" styleClass="btn btn-primary"><bean:message key="button.update" /></html:button><!-- 変更 -->
            <bean:define id="btn"><bean:message key="button.delete" /></bean:define>
            <bean:define id="msg"><bean:message key="confirm.delete" /></bean:define>
            <% String action = "doDelete('delete','" + msg + "');"; %>
            <input type="button" name="delete" value="<%=btn %>" onclick="<%=action %>" class="btn btn-warning"><!-- 削除 -->
            <html:button property="cancel" onclick="doCancel('cancel');" styleClass="btn btn-default"><bean:message key="button.cancel" /></html:button><!-- キャンセル -->
          </logic:equal>
          <logic:equal property="viewMode" name="EditReportForm" value="3">
            <html:button property="apploval" onclick="setAction('apploval');" styleClass="btn btn-primary"><bean:message key="button.approval" /></html:button><!-- 承認 -->
            <html:button property="cancel" onclick="doCancel('cancel2');" styleClass="btn btn-default"><bean:message key="button.cancel" /></html:button><!-- キャンセル -->
          </logic:equal>
          <logic:equal property="viewMode" name="EditReportForm" value="4">
            <html:button property="comment" onclick="setAction('comment');" styleClass="btn btn-primary"><bean:message key="button.comment" /></html:button><!-- コメント登録 -->
            <logic:equal property="userCom" name="CommonSession" value="2">
            <logic:equal property="applyFlag" name="EditReportForm" value="1">
              <bean:define id="btn"><bean:message key="button.release" /></bean:define>
              <bean:define id="msg"><bean:message key="confirm.release" /></bean:define>
              <% String action = "doDelete('release','" + msg + "');"; %>
              <input type="button" name="release" value="<%=btn %>" onclick="<%=action %>" class="btn btn-danger"><!-- 承認解除 -->
            </logic:equal>
            </logic:equal>
            <html:button property="cancel" onclick="doCancel('cancel');" styleClass="btn btn-default"><bean:message key="button.back" /></html:button><!-- 戻る -->
          </logic:equal>
        </div>
      </div>

      <html:hidden property="userId" />
      <html:hidden property="viewDate" />
      <html:hidden property="seq" />
      <html:hidden property="applyFlag" />
      <html:hidden property="applovalUserId" />
      <html:hidden property="button" />
      <html:hidden property="viewMode" />
      <html:hidden property="commentUser" />
    </html:form>

    <jsp:include page="../common/footer.jsp" />
  </div>
</body>
</html:html>
