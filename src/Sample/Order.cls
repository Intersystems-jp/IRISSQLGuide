Class Sample.Order Extends %Persistent [ SqlTableName = 注文 ]
{

Property Customer1 As Customer;

Property OrderDate As %Date;

Relationship Items As Sample.OrderItem [ Cardinality = children, Inverse = TheOrder ];

Property Total As %Integer [ Calculated, SqlComputeCode = { Set {Total}=##class(Sample.Order).CalcTotal({ID})}, SqlComputed ];

Index CustomerIndex1 On Customer1;

ClassMethod CalcTotal(ID As %Integer) As %Integer
{
	Set total = 0
	set statement=##class(%SQL.Statement).%New()
	set st=statement.%Prepare("SELECT TheProductStock,Quantity FROM Sample.注文明細 WHERE TheOrder->ID = ?")
	set rset=statement.%Execute(ID)
	While (rset.%Next()) {
		Set ps=rset.TheProductStock
		Set qty=rset.Quantity
		set statement2=##class(%SQL.Statement).%New()
		set st2=statement2.%Prepare("SELECT TheProductSize,TheProductSize->price As price FROM Sample.ProductStock WHERE ID = ?")
		set rset2=statement2.%Execute(ps)
 		Do rset2.%Next()
 		Set price=rset2.price
 		Set total = total + (price * qty)
	}
 	Quit total
}

Storage Default
{
<Data name="OrderDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Customer1</Value>
</Value>
<Value name="3">
<Value>OrderDate</Value>
</Value>
</Data>
<DataLocation>^Sample.OrderD</DataLocation>
<DefaultData>OrderDefaultData</DefaultData>
<IdLocation>^Sample.OrderD</IdLocation>
<IndexLocation>^Sample.OrderI</IndexLocation>
<StreamLocation>^Sample.OrderS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
