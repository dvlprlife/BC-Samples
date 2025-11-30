namespace dvlprlife.pagebackgroundtasks1.rolecenter;

codeunit 50120 "DVLPR Background Cues"
{
    trigger OnRun()
    var
        RecordRef: RecordRef;
        Result: Dictionary of [Text, Text];
        TableNo: Integer;
    begin
        if not Evaluate(TableNo, Page.GetBackgroundParameters().Get('TableNo')) then
            Error('TableNo parameter is missing or invalid');

        RecordRef.Open(TableNo);
        Result.Add('Count', Format(RecordRef.Count, 0, 9));
        Result.Add('TableNo', Format(TableNo));
        RecordRef.Close();

        Page.SetBackgroundTaskResult(Result);
    end;
}