Class Sample.ProductStock Extends (%Persistent, %Populate, %XML.Adaptor)
{

Property Color As %String(POPSPEC = "ValueList("",赤,青,黄,黒,灰色,白,緑,水色,茶,ピンク,紫""):2");

Relationship OrderItems As Sample.OrderItem [ Cardinality = many, Inverse = TheProductStock ];

Relationship TheProductSize As Sample.ProductSize [ Cardinality = parent, Inverse = ProductStocks ];

Property Quantity As %Integer;

Property SSize As %String(TRUNCATE = 1) [ Calculated, SqlComputeCode = { Set {SSize}=##class(Sample.ProductStock).GetSSize({ID})}, SqlComputed ];

Property PID As %Integer [ Calculated, SqlComputeCode = { Set {PID}=##class(Sample.ProductStock).GetPID({ID})}, SqlComputed ];

Index ColorIndex1 On Color;

ClassMethod GetPID(ID As %String) As %Integer
{
	set statement=##class(%SQL.Statement).%New()
	set st=statement.%Prepare("SELECT TheProductSize->TheProduct As PID FROM Sample.ProductStock WHERE ID = ?")
	set rset=statement.%Execute(ID)
	While (rset.%Next()) {
 		Set pid=rset.PID
 	}
	Quit pid
}

ClassMethod GetSSize(ID As %String) As %String
{
	set statement=##class(%SQL.Statement).%New()
	set st=statement.%Prepare("SELECT TheProductSize->SSize As SSize FROM Sample.ProductStock WHERE ID = ?")
	set rset=statement.%Execute(ID)
	While (rset.%Next()) {
 		Set size=rset.SSize
	}
	Quit size
}

Storage Default
{
<Data name="ProductStockDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Color</Value>
</Value>
<Value name="3">
<Value>Quantity</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("ProductStocks")</DataLocation>
<DefaultData>ProductStockDefaultData</DefaultData>
<IdLocation>^Sample.ProductSizeC("ProductStocks")</IdLocation>
<IndexLocation>^Sample.ProductStockI</IndexLocation>
<StreamLocation>^Sample.ProductStockS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
