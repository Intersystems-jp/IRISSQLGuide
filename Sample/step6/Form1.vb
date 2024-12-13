Imports InterSystems.Data.CacheClient
Imports InterSystems.Data.CacheTypes

Public Class Form1
    Private cnCache As CacheConnection
    Private cmd As CacheCommand
    Private personAdapter As CacheDataAdapter
    Private personDS As DataSet


    Private Sub btnDataReader_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDataReader.Click

        listbox1.Items.Clear()
        Dim key As String = txtKey.Text

        Dim p1 As CacheParameter = New CacheParameter("Name", CacheDbType.NVarChar)
        If key <> "" Then
            p1.Value = txtKey.Text
        Else
            p1.Value = ""
        End If

        cmd.Parameters.Add(p1)

        Dim reader As CacheDataReader = cmd.ExecuteReader

        Dim maxcnt As Integer = reader.FieldCount - 1
        Dim moji As String = ""

        While reader.Read
            For i As Integer = 0 To maxcnt
                moji = moji + reader(i).ToString
                If i < maxcnt Then
                    moji = moji + " : "
                End If
            Next
            listbox1.Items.Add(moji)
            moji = ""
        End While

        cmd.Parameters.Clear()
        reader.Close()
    End Sub

    Private Sub btnClose_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClose.Click


        If IsNothing(personDS) = False Then
            personDS.Dispose()
            personAdapter.Dispose()
        End If

        cmd.Dispose()
        cnCache.Close()
        cnCache.Dispose()
        Me.Close()

    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim cacheString As String = "Server=localhost;Port=1972; LogFile=;Namespace=USER;Password=SYS;USER ID=_system;"
        cnCache = New CacheConnection(cacheString)
        cnCache.Open()

        Dim query As String
        query = "Select * from Sample.Person where 名前 %STARTSWITH ?"
        cmd = New CacheCommand(query, cnCache)


    End Sub

    Private Sub btnDataSet_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDataSet.Click
        listbox1.Items.Clear()
        Dim key As String = txtKey.Text

        Dim p1 As CacheParameter = New CacheParameter("Name", CacheDbType.NVarChar)
        If key <> "" Then
            p1.Value = txtKey.Text
        Else
            p1.Value = ""
        End If

        cmd.Parameters.Add(p1)

        Me.CreateDataSet()

        Dim moji As String = ""
        Dim maxcnt As Integer = personDS.Tables("Person").Columns.Count - 1
        For Each dr As DataRow In personDS.Tables("Person").Rows
            For i As Integer = 0 To maxcnt
                moji = moji + dr(i).ToString
                If i < maxcnt Then
                    moji = moji + " : "
                End If
            Next
            listbox1.Items.Add(moji)
            moji = ""
        Next

        cmd.Parameters.Clear()
        personDS.Clear()
    End Sub

    Private Sub CreateDataSet()
        ' DataSetオブジェクトの作成
        personAdapter = New CacheDataAdapter
        personAdapter.SelectCommand = cmd
        personDS = New DataSet
        personAdapter.Fill(personDS, "Person")

    End Sub
End Class