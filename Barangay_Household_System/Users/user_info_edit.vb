Public Class user_info_edit
    Private Sub log_btn_Click(sender As Object, e As EventArgs) Handles log_btn.Click
        Try
            update_data("UPDATE `user` SET `username`='" & user_tb.Text & "',`password`='" & pass_tb.Text & "' WHERE `official_id`='" & user_brgy_id.Text & "'")
            Me.Close()
            connection.Close()

        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub
End Class