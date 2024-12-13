Class Sample.Address2 Extends (%SerialObject, %Populate, %XML.Adaptor)
{

Property Zip As %String;

Property Pref As %String;

Property City As %String;

Property Street As %String;

Method OnPopulate() As %Status
{
	Set id=$R($Get(^Yubin.ZenkokuD)+1)
	Set yubindata=^Yubin.ZenkokuD(id)
	Set ..Zip=$List(yubindata,4)
	Set ..Pref=$List(yubindata,8)
	Set ..City=$List(yubindata,9)
	Set ..Street=$List(yubindata,10)
	QUIT $$$OK
}

Storage Default
{
<Data name="Address2State">
<Subscript>"Sample.Address2"</Subscript>
<Value name="1">
<Value>City</Value>
</Value>
<Value name="2">
<Value>Pref</Value>
</Value>
<Value name="3">
<Value>Street</Value>
</Value>
<Value name="4">
<Value>Zip</Value>
</Value>
</Data>
<State>Address2State</State>
<StreamLocation>^Sample.Address2S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
