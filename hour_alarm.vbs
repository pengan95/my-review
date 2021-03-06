Dim speaker, voice_type
hour_now=hour(time)

' 获取上下午
If hour_now > 12 Then
    hour12 = hour_now - 12
    en_ampm = "PM"
    zh_ampm = "下午"
Else
    en_ampm = "AM"
    zh_ampm = "上午"
    hour12 = hour_now
End If

' 获取中文时
If hour12 = 0 Then
        zh_hourfinal = "零"
    Elseif hour12 = 1 Then
        zh_hourfinal = "一"
    Elseif hour12 = 2 Then
        zh_hourfinal = "两"
    Elseif hour12 = 3 Then
        zh_hourfinal = "三"
    Elseif hour12 = 4 Then
        zh_hourfinal = "四"
    Elseif hour12 = 5 Then
        zh_hourfinal = "五"
    Elseif hour12 = 6 Then
        zh_hourfinal = "六"
    Elseif hour12 = 7 Then
        zh_hourfinal = "七"
    Elseif hour12 = 8 Then
        zh_hourfinal = "八"
    Elseif hour12 = 9 Then
        zh_hourfinal = "九"
    Elseif hour12 = 10 Then
        zh_hourfinal = "十"
    Elseif hour12 = 11 Then
        zh_hourfinal = "十一"
    Elseif hour12 = 12 Then
        zh_hourfinal = "十二"
End If

' 获取英文时
If hour12 = 10 Then
        en_hourfinal = "Ten"
    Elseif hour12 = 11 Then
        en_hourfinal = "Eleven"
    Elseif hour12 = 12 Then
        en_hourfinal = "Twelve"
    Else
        en_hourfinal = hour12
End If

zh_speaks = "现在是"  & zh_ampm & zh_hourfinal & "点钟"
en_speaks = "It is " & en_hourfinal & " o clock " & ampm

voice_type = "en" 
Set sp = createobject("SAPI.SpVoice")

Set Voices = sp.GetVoices()   '获得语音引擎集合

For i=0 to Voices.count-1
    If InStr(UCase(Voices(i).Id),"ZH-CN") > 1 Then
        voice_type = "chs"
        speaker_index = i
        Exit For
    End If
    speaker_index = i
Next

Set sp.Voice = Voices.Item(speaker_index)

If voice_type = "chs" Then
    sp.speak(zh_speaks)
Else
    sp.speak(en_speaks)
End If

' 1. https://www.addictivetips.com/windows-tips/get-windows-to-chime-on-the-hour/ 调用报时
' 2. http://demon.tw/programming/vbs-file-unicode.html 编码问题
' 3. https://blog.csdn.net/belldeep/article/details/7064800 中文tts
' 4. https://www.zhangshengrong.com/p/x7XRm2zNz3/ tts api 进阶
' 5. 定时执行 通过任务计划程序 后续通过vbs调用接口生成自动任务
' 6. https://www.makeuseof.com/tag/windows-speak-time-every-hour/ 获取时间
' 7. Vbs 打包成exe