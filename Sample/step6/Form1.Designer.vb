﻿<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'フォームがコンポーネントの一覧をクリーンアップするために dispose をオーバーライドします。
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Windows フォーム デザイナで必要です。
    Private components As System.ComponentModel.IContainer

    'メモ: 以下のプロシージャは Windows フォーム デザイナで必要です。
    'Windows フォーム デザイナを使用して変更できます。  
    'コード エディタを使って変更しないでください。
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.Label1 = New System.Windows.Forms.Label
        Me.txtSerchKey = New System.Windows.Forms.TextBox
        Me.btnConnectDataSet = New System.Windows.Forms.Button
        Me.listbox1 = New System.Windows.Forms.ListBox
        Me.btnEnd = New System.Windows.Forms.Button
        Me.btnConnectDataReader = New System.Windows.Forms.Button
        Me.Label2 = New System.Windows.Forms.Label
        Me.txtKey = New System.Windows.Forms.TextBox
        Me.btnDataSet = New System.Windows.Forms.Button
        Me.btnClose = New System.Windows.Forms.Button
        Me.btnDataReader = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(-218, 48)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(161, 12)
        Me.Label1.TabIndex = 13
        Me.Label1.Text = "検索条件キー：名前の前方一致"
        '
        'txtSerchKey
        '
        Me.txtSerchKey.Location = New System.Drawing.Point(-208, 64)
        Me.txtSerchKey.Name = "txtSerchKey"
        Me.txtSerchKey.Size = New System.Drawing.Size(142, 19)
        Me.txtSerchKey.TabIndex = 12
        '
        'btnConnectDataSet
        '
        Me.btnConnectDataSet.Location = New System.Drawing.Point(-208, 89)
        Me.btnConnectDataSet.Name = "btnConnectDataSet"
        Me.btnConnectDataSet.Size = New System.Drawing.Size(142, 36)
        Me.btnConnectDataSet.TabIndex = 11
        Me.btnConnectDataSet.Text = "接続（DataSet）"
        Me.btnConnectDataSet.UseVisualStyleBackColor = True
        '
        'listbox1
        '
        Me.listbox1.FormattingEnabled = True
        Me.listbox1.ItemHeight = 12
        Me.listbox1.Location = New System.Drawing.Point(183, 16)
        Me.listbox1.Name = "listbox1"
        Me.listbox1.ScrollAlwaysVisible = True
        Me.listbox1.Size = New System.Drawing.Size(554, 160)
        Me.listbox1.TabIndex = 10
        '
        'btnEnd
        '
        Me.btnEnd.BackColor = System.Drawing.Color.MidnightBlue
        Me.btnEnd.Font = New System.Drawing.Font("MS UI Gothic", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(128, Byte))
        Me.btnEnd.ForeColor = System.Drawing.SystemColors.ButtonHighlight
        Me.btnEnd.Location = New System.Drawing.Point(-208, 179)
        Me.btnEnd.Name = "btnEnd"
        Me.btnEnd.Size = New System.Drawing.Size(142, 36)
        Me.btnEnd.TabIndex = 9
        Me.btnEnd.Text = "終了"
        Me.btnEnd.UseVisualStyleBackColor = False
        '
        'btnConnectDataReader
        '
        Me.btnConnectDataReader.Location = New System.Drawing.Point(-208, 131)
        Me.btnConnectDataReader.Name = "btnConnectDataReader"
        Me.btnConnectDataReader.Size = New System.Drawing.Size(142, 36)
        Me.btnConnectDataReader.TabIndex = 8
        Me.btnConnectDataReader.Text = "接続（DataReader）"
        Me.btnConnectDataReader.UseVisualStyleBackColor = True
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(2, 9)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(161, 12)
        Me.Label2.TabIndex = 18
        Me.Label2.Text = "検索条件キー：名前の前方一致"
        '
        'txtKey
        '
        Me.txtKey.Location = New System.Drawing.Point(12, 25)
        Me.txtKey.Name = "txtKey"
        Me.txtKey.Size = New System.Drawing.Size(142, 19)
        Me.txtKey.TabIndex = 17
        '
        'btnDataSet
        '
        Me.btnDataSet.Location = New System.Drawing.Point(12, 50)
        Me.btnDataSet.Name = "btnDataSet"
        Me.btnDataSet.Size = New System.Drawing.Size(142, 36)
        Me.btnDataSet.TabIndex = 16
        Me.btnDataSet.Text = "接続（DataSet）"
        Me.btnDataSet.UseVisualStyleBackColor = True
        '
        'btnClose
        '
        Me.btnClose.BackColor = System.Drawing.Color.MidnightBlue
        Me.btnClose.Font = New System.Drawing.Font("MS UI Gothic", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(128, Byte))
        Me.btnClose.ForeColor = System.Drawing.SystemColors.ButtonHighlight
        Me.btnClose.Location = New System.Drawing.Point(12, 140)
        Me.btnClose.Name = "btnClose"
        Me.btnClose.Size = New System.Drawing.Size(142, 36)
        Me.btnClose.TabIndex = 15
        Me.btnClose.Text = "終了"
        Me.btnClose.UseVisualStyleBackColor = False
        '
        'btnDataReader
        '
        Me.btnDataReader.Location = New System.Drawing.Point(12, 92)
        Me.btnDataReader.Name = "btnDataReader"
        Me.btnDataReader.Size = New System.Drawing.Size(142, 36)
        Me.btnDataReader.TabIndex = 14
        Me.btnDataReader.Text = "接続（DataReader）"
        Me.btnDataReader.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 12.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(749, 187)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.txtKey)
        Me.Controls.Add(Me.btnDataSet)
        Me.Controls.Add(Me.btnClose)
        Me.Controls.Add(Me.btnDataReader)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.txtSerchKey)
        Me.Controls.Add(Me.btnConnectDataSet)
        Me.Controls.Add(Me.listbox1)
        Me.Controls.Add(Me.btnEnd)
        Me.Controls.Add(Me.btnConnectDataReader)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents txtSerchKey As System.Windows.Forms.TextBox
    Friend WithEvents btnConnectDataSet As System.Windows.Forms.Button
    Friend WithEvents listbox1 As System.Windows.Forms.ListBox
    Friend WithEvents btnEnd As System.Windows.Forms.Button
    Friend WithEvents btnConnectDataReader As System.Windows.Forms.Button
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents txtKey As System.Windows.Forms.TextBox
    Friend WithEvents btnDataSet As System.Windows.Forms.Button
    Friend WithEvents btnClose As System.Windows.Forms.Button
    Friend WithEvents btnDataReader As System.Windows.Forms.Button

End Class
