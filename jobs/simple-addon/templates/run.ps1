try
{
    New-Item -Path "C:\" -Name "testfile.txt" -ItemType "file" -Value "This is a text string." -Force
}
catch
{
    $Host.UI.WriteErrorLine($_.Exception.Message)
    Exit 1
}
Exit 0
