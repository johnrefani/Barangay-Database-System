﻿
Public Class signup_form

    Private Sub log_btn_Click(sender As Object, e As EventArgs) Handles log_btn.Click
        Try

            create_data("INSERT INTO `user`(`official_id`, `username`, `password`) VALUES ('" & user_brgy_id.Text & "','" & user_tb.Text & "','" & pass_tb.Text & "')")

            Me.Close()
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub
End Class