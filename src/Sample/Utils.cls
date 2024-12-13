/// SQL機能ガイド　4.2　以降で利用するSQL実行用メソッドを定義したクラス
Class Sample.Utils
{

/// 埋め込みSQLによるSELECT文（1行のみ）
ClassMethod PersonSelect()
{
	&sql(SELECT ID, 名前 into :id, :Name FROM Sample.Person WHERE ID = 10)
    if SQLCODE<0 {
	    Write !,"SELECT Error SQLCODE = ",SQLCODE    
    } 
    Else { 
     Write "名前: ",##class(Sample.JNAME).LogicalToDisplay(Name),!
    }
}

/// 埋め込みSQL：カーソルの利用
ClassMethod PersonSelectAll()
{
  &sql(DECLARE PersonCur CURSOR FOR
  SELECT 名前,誕生日 into :Name, :DOB FROM Sample.Person ORDER BY 名前)
  
  &sql(OPEN PersonCur)
  
  &sql(FETCH PersonCur)
  For  {
	  If SQLCODE Quit
	  Write "名前: ",##class(Sample.JNAME).LogicalToDisplay(Name),!
	  Write "誕生日: ",##class(%Date).LogicalToDisplay(DOB),!
      &sql(FETCH PersonCur)
  }
  &sql(CLOSE PersonCur)
}

/// クラスクエリの実行:　先頭1行の取得
ClassMethod PersonResultSet(name As %String)
{
   Set byname = ##class(%ResultSet).%New("Sample.Person:ByName")
   Do byname.Execute(name)
 
   While (byname.Next()) {
     Write "id = ",byname.GetData(1),!
     Write "名前 = ",##class(Sample.JNAME).LogicalToDisplay(byname.GetData(2)),!
   }
}

/// ダイナミックSQLの実行
ClassMethod PersonDynamicSQL()
{
	set statement=##class(%SQL.Statement).%New()
	set st=statement.%Prepare("SELECT ID, 名前 FROM Sample.Person ORDER BY 名前")
	set rset=statement.%Execute()
	while (rset.%Next()) {
		write !,"名前：",##class(Sample.JNAME).LogicalToDisplay(rset.名前)
	}
}

ClassMethod PersonSQLList()
{
	&sql(DECLARE ListCur CURSOR FOR
	SELECT 名前,誕生日,好きな色 into :Name, :DOB, :color FROM Sample.Person ORDER BY 名前)
	&sql(OPEN ListCur)

	For {
		&sql(FETCH ListCur)

		if SQLCODE'=0 {quit}
		
		Write "名前: ",##class(Sample.JNAME).LogicalToDisplay(Name),!
		Write "誕生日: ",##class(%Date).LogicalToDisplay(DOB),!
		Write "好きな色: "
		for i=1:1:$LL(color) {
			Write $List(color,i)," "
	  	}
	  	Write !
	}
	&sql(CLOSE ListCur)
}

}
