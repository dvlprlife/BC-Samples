namespace dvlprlife.samples.stream1;

using System.Utilities;

codeunit 50190 "DVLPR Stream Samples"
{
    // Demonstrates InStream and OutStream usage in Business Central AL.
    // Based on the Quick Tips article: InStream and OutStream in AL.

    #region InStream and OutStream Basics

    /// <summary>
    /// InStreamOutStreamDemo: Writes text into a BLOB using OutStream
    /// and reads it back using InStream.
    /// </summary>
    procedure InStreamOutStreamDemo()
    var
        TempBlob: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
        Result: Text;
    begin
        // Write TO the BLOB using OutStream
        TempBlob.CreateOutStream(OutStr, TextEncoding::UTF8);
        OutStr.WriteText('Hello from OutStream!');

        // Read FROM the BLOB using InStream
        TempBlob.CreateInStream(InStr, TextEncoding::UTF8);
        InStr.ReadText(Result);

        Message(Result); // 'Hello from OutStream!'
    end;

    #endregion

    #region File Upload with InStream

    /// <summary>
    /// ImportTextFile: Prompts the user to upload a text file and reads
    /// its contents line by line using InStream and EOS().
    /// </summary>
    procedure ImportTextFile()
    var
        InStr: InStream;
        FileName: Text;
        Line: Text;
        FullContent: TextBuilder;
    begin
        // Prompt the user to select a file — this gives us an InStream
        if not UploadIntoStream('Select a text file', '', 'Text Files (*.txt)|*.txt', FileName, InStr) then
            exit;

        // Read the file line by line until End of Stream
        while not InStr.EOS() do begin
            InStr.ReadText(Line);
            FullContent.AppendLine(Line);
        end;

        Message('File: %1\Contents:\%2', FileName, FullContent.ToText());
    end;

    #endregion

    #region Import and Export with BLOB Fields

    /// <summary>
    /// ImportFileToBlobField: Uploads a file and stores it in a BLOB field
    /// using CopyStream to pipe the InStream into an OutStream.
    /// </summary>
    procedure ImportFileToBlobField(var StreamDemo: Record "DVLPR Stream Demo")
    var
        InStr: InStream;
        OutStr: OutStream;
        FileName: Text;
    begin
        // Upload the file — UploadIntoStream gives us an InStream to READ from
        if not UploadIntoStream('Select a file', '', '', FileName, InStr) then
            exit;

        // Create an OutStream on the BLOB field to WRITE the file data into it
        StreamDemo."Blob Field".CreateOutStream(OutStr);
        CopyStream(OutStr, InStr);
        StreamDemo."File Name" := CopyStr(FileName, 1, MaxStrLen(StreamDemo."File Name"));
        StreamDemo.Modify(true);

        Message('File "%1" saved to the BLOB field.', FileName);
    end;

    /// <summary>
    /// ExportBlobFieldToFile: Reads data from a BLOB field using InStream
    /// and downloads it to the user via DownloadFromStream.
    /// </summary>
    procedure ExportBlobFieldToFile(var StreamDemo: Record "DVLPR Stream Demo")
    var
        InStr: InStream;
        FileName: Text;
    begin
        StreamDemo.CalcFields("Blob Field");
        if not StreamDemo."Blob Field".HasValue() then begin
            Message('No file stored in the BLOB field. Import a file first.');
            exit;
        end;

        // Create an InStream on the BLOB field to READ the data back out
        StreamDemo."Blob Field".CreateInStream(InStr);
        FileName := StreamDemo."File Name";
        if FileName = '' then
            FileName := 'ExportedFile.txt';
        DownloadFromStream(InStr, 'Export File', '', '', FileName);
    end;

    #endregion

    #region Multi-Line OutStream Writing

    /// <summary>
    /// WriteMultipleLines: Demonstrates writing multiple lines of text into
    /// a TempBlob using OutStream and reading the entire content back with InStream.
    /// </summary>
    procedure WriteMultipleLines()
    var
        TempBlob: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
        Line: Text;
        FullContent: TextBuilder;
        CrLf: Text[2];
    begin
        CrLf[1] := 13; // CR
        CrLf[2] := 10; // LF

        // Write several lines using OutStream
        TempBlob.CreateOutStream(OutStr, TextEncoding::UTF8);
        OutStr.WriteText('Line 1 — written with OutStream');
        OutStr.WriteText(CrLf);
        OutStr.WriteText('Line 2 — still writing');
        OutStr.WriteText(CrLf);
        OutStr.WriteText('Line 3 — last line');

        // Read all lines back using InStream
        TempBlob.CreateInStream(InStr, TextEncoding::UTF8);
        while not InStr.EOS() do begin
            InStr.ReadText(Line);
            FullContent.AppendLine(Line);
        end;

        Message('Multi-line content:\%1', FullContent.ToText());
    end;

    #endregion

    #region CopyStream Between TempBlobs

    /// <summary>
    /// CopyStreamDemo: Demonstrates using CopyStream to pipe data from
    /// one TempBlob to another without manual looping.
    /// </summary>
    procedure CopyStreamDemo()
    var
        SourceBlob: Codeunit "Temp Blob";
        TargetBlob: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
        TargetInStr: InStream;
        Result: Text;
    begin
        // Write data into the source blob
        SourceBlob.CreateOutStream(OutStr, TextEncoding::UTF8);
        OutStr.WriteText('Data to copy from source to target');

        // Pipe source → target using CopyStream
        SourceBlob.CreateInStream(InStr, TextEncoding::UTF8);
        TargetBlob.CreateOutStream(OutStr, TextEncoding::UTF8);
        CopyStream(OutStr, InStr);

        // Read from the target to confirm
        TargetBlob.CreateInStream(TargetInStr, TextEncoding::UTF8);
        TargetInStr.ReadText(Result);

        Message('CopyStream result:\%1', Result);
    end;

    #endregion
}
