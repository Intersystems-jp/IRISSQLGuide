/// This sample persistent class represents a person.<br>
Class Sample.Person Extends (%Persistent, %Populate, %XML.Adaptor)
{

Parameter EXTENTQUERYSPEC = "Name,Home.City,Home.State";

// define indices for this class

/// Define an index for <property>Name</property>.
Index NameIDX On Name [ Data = Name ];

/// Define an index for embedded object property <b>ZipCode</b>.
Index ZipCode On Home.Zip [ Type = bitmap ];

// define properties for this class

/// Person's name.
Property Name As JNAME(POPSPEC = "##Class(Sample.PopulateUtils).Name()") [ Required, SqlFieldName = 名前 ];

/// Person's Date of Birth.
Property DOB As %Date(POPSPEC = "Date()") [ SqlFieldName = 誕生日 ];

/// Person's home address. This uses an embedded object.
Property Home As Address1 [ SqlFieldName = 自宅 ];

/// Person's office address. This uses an embedded object.
Property Office As Address1 [ SqlFieldName = 勤務先 ];

/// Person's spouse. This is a reference to another persistent object.
Property Spouse As Person [ SqlFieldName = 配偶者 ];

/// Person's car. This is a reference to another persistent object.
Property Car As Car [ SqlFieldName = 車 ];

/// A collection of strings representing the person's favorite colors.
Property FavoriteColors As list Of %String(JAVATYPE = "java.util.List", POPSPEC = "ValueList("",赤,オレンジ,黄色,緑,青,紫,黒,白""):2") [ SqlFieldName = 好きな色 ];

/// Person's age.<br>
/// This is a calculated field whose value is derived from <property>DOB</property>.
Property Age As %Integer [ Calculated, SqlComputeCode = { Set {年令}=$select({誕生日}="":"",1:$horolog-{誕生日}\365.25)}, SqlComputed, SqlComputeOnChange = DOB, SqlFieldName = 年令 ];

/// Prints the property <property>Name</property> to the console.
Method PrintPerson()
{
 Write !, "名前: ", ..Name
 Quit
}

/// A simple, sample method: add two numbers (<var>x</var> and <var>y</var>) 
/// and return the result.
Method Addition(x As %Integer = 1, y As %Integer = 1) As %Integer
{
 Quit x + y // comment
}

/// A simple, sample expression method: returns the value 99.
Method NinetyNine() As %Integer [ CodeMode = expression ]
{
99
}

/// Invoke the <method>PrintPerson</method> on all <class>Person</class> objects 
/// within the database.
ClassMethod PrintPersons()
{

 // use the extent result set to find all person
 Set extent = ##class(%ResultSet).%New("Sample.Person:Extent")
 Do extent.Execute()

 While (extent.Next()) {
 	Set person = ..%OpenId(extent.GetData(1))
 	Do person.PrintPerson()
 }

 Quit
}

/// Prints out data on all persons within the database using SQL to 
/// iterate over all the person data.
ClassMethod PrintPersonsSQL()
{
 // use dynamic SQL result set to find person data
 Set query = ##class(%ResultSet).%New("%DynamicQuery:SQL")
 Do query.Prepare("SELECT ID, 名前 FROM Sample.Person ORDER BY 名前")
 Do query.Execute()

 While (query.Next()) {
 	Write !,"名前: ", query.Get("名前")
 }

 Quit
}

/// This is a sample of how to define an SQL stored procedure using a 
/// class method. This method can be called as a stored procedure via 
/// ODBC or JDBC.<br>
/// In this case this method returns the concatenation of a string value.
ClassMethod StoredProcTest(name As %String, ByRef response As %String) As %String [ SqlName = Stored_Procedure_Test, SqlProc ]
{
 // Set response to the concatenation of name.
 Set response = $Piece(name,",",1)_"  "_$Piece(name,",",2)
 QUIT response
}

/// This is a sample of how to define an SQL stored procedure using a 
/// class method. This method can be called as a stored procedure via 
/// ODBC or JDBC.<br>
/// This method performs an SQL update operation on the database 
/// using embedded SQL. The update modifies the embedded properties 
/// <var>Home.City</var> and <var>Home.State</var> for all rows whose 
/// <var>Home.Zip</var> is equal to <var>zip</zip>.
ClassMethod UpdateProcTest(zip As %String, city As %String, state As %String) As %Integer [ SqlProc ]
{
 &sql(UPDATE Sample.Person 
 SET 自宅_都市 = :city, 自宅_都道府県 = :state 
 WHERE 自宅_郵便番号 = :zip)

 // Return context information to client via %SQLProcContext object
 If ($g(%sqlcontext)'=$$$NULLOREF) { 
 Set %sqlcontext.SQLCode = SQLCODE
 Set %sqlcontext.RowCount = %ROWCOUNT
 }
 QUIT 1
}

/// A sample class query that defines a result set that returns Person data 
/// ordered by <property>Name</property>.<br>
/// This query can be used within another Cach&eacute; method (using the
/// <class>%ResultSet</class> class), from Java, or from ActiveX.<br>
/// This query is also accessible from ODBC and/or JDBC as the SQL stored procedure 
/// <b>SP_Sample_By_Name</b>.
Query ByName(name As %String = "") As %SQLQuery(CONTAINID = 1, ROWSPEC = "ID:%Integer,名前:%String(MAXLEN=30),誕生日", SELECTMODE = "RUNTIME") [ SqlName = SP_Sample_By_Name, SqlProc ]
{
 SELECT ID, 名前, 誕生日
 FROM Sample.Person
 WHERE (名前 %STARTSWITH :name)
 ORDER BY 名前
}

Storage Default
{
<Data name="PersonDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>DOB</Value>
</Value>
<Value name="4">
<Value>Home</Value>
</Value>
<Value name="5">
<Value>Office</Value>
</Value>
<Value name="6">
<Value>Spouse</Value>
</Value>
<Value name="7">
<Value>Car</Value>
</Value>
<Value name="8">
<Value>FavoriteColors</Value>
</Value>
</Data>
<DataLocation>^Sample.PersonD</DataLocation>
<DefaultData>PersonDefaultData</DefaultData>
<ExtentSize>20</ExtentSize>
<IdLocation>^Sample.PersonD</IdLocation>
<IndexLocation>^Sample.PersonI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(1,2,4,6,8,10,11,12,13,14,15,16,17,18,19,20),$lb(0,0,0,0,0,1,1,1,1,1,1,1,1,1,0),"")</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="Age">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(10,15,24,32,40,42,45,52,52,61,68,73,89,94,98,99),$lb(1,0,0,0,1,1,0,2,0,1,0,0,0,1,1),"")</Histogram>
<Selectivity>5.2632%</Selectivity>
</Property>
<Property name="Car">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(1,1,2,3,3,4,5,5,6,7,7,7,8,9,9,9),$lb(1,0,0,1,0,0,1,0,0,1,1,0,0,1,1),"")</Histogram>
<Selectivity>11.1111%</Selectivity>
</Property>
<Property name="DOB">
<AverageFieldSize>4</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(30700,31095,34676,42167,47939,50431,51802,51898,52475,54062,55201,55909,58167,61123,61355,63416),$lb(1,1,0,1,0,1,3,1,1,1,2,1,0,2,1),"")</Histogram>
<Selectivity>5.0000%</Selectivity>
</Property>
<Property name="FavoriteColors">
<AverageFieldSize>8.4</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,4,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000",$lb("白","紫"),$lb("緑","紫"),$lb("黒"),$lb("黒","黄色"),$lb("黄色"),$lb("黄色"),$lb("黄色"),$lb("黄色","白"),$lb("オレンジ"),$lb("オレンジ"),$lb("オレンジ","白"),$lb("オレンジ","オレンジ")),$lb(21,21,21,0,5,5,7,5,9,9,8,5,11,10,12),$lb(758198320,0,0,0,0,0,0,758198320,67272054,36404480,36404480,36404480,0,0,2658304512,46440050,2181038080,0,0,0,0,0,2104885248,2181300861,821244088,0,0,0,67272054,2104885248,2855332912,167946800))</Histogram>
<Selectivity>8.3333%</Selectivity>
</Property>
<Property name="Home">
<AverageFieldSize>37.9,地名:8.7,郵便番号:9,都市:10.2,都道府県:8</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb($lb("横町","須崎市","高知県","7850014"),$lb("魚町","七尾市","石川県","9260864"),$lb("宮田","天草郡倉岳町","熊本県","8616403"),$lb("下野町","竹原市","広島県","7250012"),$lb("大同町","茨木市","大阪府","5670844"),$lb("中条乙","十日町市","新潟県","9498616"),$lb("桜田町","金沢市","石川県","9200057"),$lb("松木島","幡豆郡一色町","愛知県","4440403"),$lb("松原町","碧南市","愛知県","4470079"),$lb("香林坊","金沢市","石川県","9200961"),$lb("加茂中","大原郡加茂町","島根県","6991106"),$lb("橋本尻江","八幡市","京都府","6148312"),$lb("東９号北","上川郡東川町","北海道","0711439"),$lb("金足下刈","秋田市","秋田県","0100114"),$lb("田刈屋新町","富山市","富山県","9300894"),$lb("以下に掲載がない場合","勝浦郡上勝町","徳島県","7714500")),$lb(5,5,5,5,5,5,5,6,5,5,5,5,5,5,5),$lb(100805226,1963459080,1963459075,1963459075,1963852329,1963852329,2436527368,2436527368,1413117192,1413117192,1733905930,1733905930,1966765320,1966765320,1744198670,4133228034,980748290,1396339976,1732925192,1732925192,2200784398,2200784398,1731943519,1731943519,4294398743,4294398743,2366328328,2366328328,1380670640,1380670640,1315647666,369288526)),地名:$lb(.06666666666666666667,0,0,$lb(" 下野町"," 中条乙"," 加茂中"," 宮田"," 東９号北"," 松木島"," 桜田町"," 横町"," 橋本尻江"," 田刈屋新町"," 碧水"," 蓮池"," 金足下刈"," 頓原村"," 香林坊"," 魚町"),$lb(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),$lb(551860363,3837299689,3837308390,3837308390,3851067624,3851067624,3853430503,3853430503,3869094383,3869094383,3869097702,3869097702,3869351143,3869351143,3869813479,3869813479,3869871078,3869871078,3885281509,3885281509,3886196710,3886196710,3901992678,3901992678,3917976040,3917976040,3919614949,3919614949,3920009702,3920009702,3920468711,552185242)),郵便番号:$lb(.06666666666666666667,0,0,$lb(" 0100114"," 0711439"," 4440403"," 5200812"," 6148312"," 6991106"," 7250012"," 7714500"," 7811105"," 7850014"," 8616403"," 9200057"," 9200961"," 9260864"," 9300894"," 9498616"),$lb(2,1,1,1,2,1,2,2,3,1,1,5,3,2,2),$lb(540029232,825241649,925970740,808923441,875836464,875836464,892481584,892481584,909194296,825505843,960049457,909719857,926037296,842346544,925971509,925971509,942747953,825307440,892350513,926430512,943075638,943075638,959590448,808793856,959852800,808466742,909129782,842412088,858796088,858796088,876165174,540619833)),都市:$lb(.06666666666666666667,0,0,$lb(" 七尾市"," 上川郡東川町"," 勝浦郡上勝町"," 土佐市"," 大津市"," 富山市"," 幡豆郡一色町"," 碧南市"," 秋田市"," 竹原市"," 茨木市"," 金沢市"," 金沢市"," 雨竜郡北竜町"," 須崎市"," 飯石郡頓原町"),$lb(1,1,1,1,1,1,1,1,1,1,1,5,1,1,1),$lb(551860355,3837297637,3837299429,3837299429,3851132390,3851132390,3852247012,3852247012,3852773350,3852773350,3853487333,3853487333,3854148072,3854148072,3886196709,3886196709,3886517223,3886517223,3886791141,3886791141,3901532390,3901532390,3917976038,0,0,3917976038,3919292647,3919292647,3919612133,3919612133,3919818727,552182703)),都道府県:$lb(.06666666666666666667,0,0,$lb(" 京都府"," 北海道"," 大阪府"," 島根県"," 広島県"," 愛知県"," 愛知県"," 新潟県"," 滋賀県"," 熊本県"," 石川県"," 石川県"," 石川県"," 秋田県"," 高知県"," 高知県"),$lb(1,1,1,1,1,5,1,1,1,1,5,5,1,1,5),$lb(551860908,3837439209,3851196390,3851196390,3852773353,3852773353,3853760230,3853760230,3854205925,3854205925,3867450343,0,0,3867450343,3868635366,3868635366,3871050728,3871050728,3884354278,3884354278,3886003173,0,0,0,0,3886003173,3886517223,3886517223,3920337127,0,0,552184728))</Histogram>
<Selectivity>5.0000%,地名:5.0000%,郵便番号:5.0000%,都市:5.2632%,都道府県:7.1429%</Selectivity>
</Property>
<Property name="Name">
<AverageFieldSize>11.9</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 三好,伊代"," 伊藤,エミリ"," 吉村,高志"," 奥山,正一"," 山崎,信弘"," 柳,孝子"," 橋本,誠一"," 河野,幸博"," 波内,康之"," 砂川,裕香"," 細田,雄三"," 荒川,博康"," 藤木,秀美"," 金子,洋子"," 金沢,孝子"," 高岡,真紀"),$lb(1,1,1,1,1,1,1,1,1,1,1,1,1,2,1),$lb(551860361,3837299173,3837561576,3837561576,3851454950,3851454950,3852838373,3852838373,3853627877,3853627877,3869225772,3869225772,3869871078,3869871078,3870471145,3870471145,3870532325,3870532325,3886056165,3886056165,3887378663,3887378663,3901592293,3901592293,3902252262,3902252262,3917976037,3853357100,3870466604,3917976038,3920337125,552184728))</Histogram>
<Selectivity>5.0000%</Selectivity>
</Property>
<Property name="Office">
<AverageFieldSize>38.2,地名:7.5,郵便番号:9,都市:11.5,都道府県:8.2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb($lb("宮","日野市","東京都","1910013"),$lb("小房","英田郡作東町","岡山県","7094201"),$lb("錦町","米子市","鳥取県","6830811"),$lb("佐原","宮古市","岩手県","0270095"),$lb("奥住","郡上郡明宝村","岐阜県","5014304"),$lb("友沼","下都賀郡野木町","栃木県","3290101"),$lb("川匂","小田原市","神奈川県","2560814"),$lb("三森町","函館市","北海道","0420906"),$lb("尉ケ畑","熊野郡久美浜町","京都府","6293564"),$lb("北栄町","長崎市","長崎県","8528063"),$lb("木崎野","東礪波郡井波町","富山県","9320221"),$lb("呉服町","萩市","山口県","7580072"),$lb("井口町","碧南市","愛知県","4470002"),$lb("立花町","今治市","愛媛県","7940821"),$lb("柳が崎","大津市","滋賀県","5200022"),$lb("以下に掲載がない場合","山辺郡都祁村","奈良県","6320200")),$lb(5,5,5,5,5,5,5,5,5,5,5,5,5,5,5),$lb(67284571,48588238,1645085425,1645085425,1963459187,1963459187,1393033902,1393033902,1326318305,1326318305,1812988427,1812988427,1393164815,1393164815,1748661512,1748661512,810644752,810644752,1748661512,1748661512,1573818640,1573818640,1731884294,1731884294,1396339976,1396339976,2184869128,2184869128,806247688,806247688,1315647666,369288526)),地名:$lb(.06666666666666666667,0,0,$lb(" 三森町"," 井口町"," 以下に掲載がない場合"," 北栄町"," 呉服町"," 奥住"," 宮"," 尉ケ畑"," 小坂"," 小房"," 川匂"," 木崎野"," 柳が崎"," 神宮"," 立花町"," 錦町"),$lb(1,1,1,1,1,1,1,1,2,1,1,1,1,1,1),$lb(551860361,3837299174,3837433317,3837433317,3837502948,3837502948,3851196390,3851196390,3851520486,3851520486,3852838372,3852838372,3853430272,3853430272,3853552099,3853552099,3853553637,3852304896,3867721472,3853553638,3854015973,3854015973,3869026533,3869026533,3869225955,3869225955,3886391013,3886391013,3886779368,3886779368,3918309095,552176806)),郵便番号:$lb(.06666666666666666667,0,0,$lb(" 0270095"," 0420906"," 2560814"," 3290101"," 5014304"," 6293564"," 6320200"," 6830811"," 7090523"," 7094201"," 7580072"," 7940821"," 8528063"," 8995121"," 9320221"," 9901563"),$lb(2,1,1,1,1,2,2,1,4,2,2,1,2,1,2),$lb(540029495,842477616,875704377,808727088,842348080,842348080,858929456,858929456,892350772,892350772,909261107,842609461,858927154,858927154,942878776,909652784,925907248,808792627,875704369,809055282,892874800,892874800,959721528,926495792,943010360,892483632,960050481,943274293,959656496,858927154,959459637,540621104)),都市:$lb(.06666666666666666667,0,0,$lb(" 下都賀郡野木町"," 今治市"," 和気郡佐伯町"," 姶良郡隼人町"," 小田原市"," 日野市"," 東礪波郡井波町"," 熊野郡久美浜町"," 碧南市"," 米子市"," 結城郡八千代町"," 英田郡作東町"," 萩市"," 西村山郡朝日町"," 郡上郡明宝村"," 長崎市"),$lb(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),$lb(551860363,3837299689,3837496038,3837496038,3851586790,3851586790,3852973800,3852973800,3853553639,3853553639,3868698089,3868698089,3869094375,3869094375,3884354281,3884354281,3886196709,3886196709,3887182821,3887182821,3887436005,3887436005,3901469159,3901469159,3901794789,3901794789,3903176678,3903176678,3917717988,3917717988,3918903269,552179127)),都道府県:$lb(.06666666666666666667,0,0,$lb(" 京都府"," 北海道"," 富山県"," 山形県"," 岡山県"," 岩手県"," 愛媛県"," 愛知県"," 東京都"," 栃木県"," 滋賀県"," 神奈川県"," 茨城県"," 長崎県"," 鳥取県"," 鹿児島県"),$lb(1,1,1,1,1,1,2,1,1,1,1,1,1,1,1),$lb(551860908,3837439209,3851196390,3851196390,3853487333,3853487333,3853627877,3853627877,3853689317,3853689317,3853691366,3853691366,3867450341,3853163495,3885999591,3867450343,3869094372,3869094372,3869279206,3869279206,3871050728,3871050728,3886391013,3886391013,3901532389,3901532389,3918903269,3918903269,3920864741,3920864741,3921264613,552188351))</Histogram>
<Selectivity>5.0000%,地名:5.0000%,郵便番号:5.0000%,都市:5.0000%,都道府県:5.2632%</Selectivity>
</Property>
<Property name="Spouse">
<AverageFieldSize>2.55</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,6,$lb(-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,-10000000000000000000,1,1,1,2,2,3,8,8,8,10),$lb(21,21,21,21,21,0,1,1,0,1,0,0,1,1,0),"")</Histogram>
<Selectivity>16.6667%</Selectivity>
</Property>
<SQLMap name="$Person">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="NameIDX">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="ZipCode">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^Sample.PersonS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
