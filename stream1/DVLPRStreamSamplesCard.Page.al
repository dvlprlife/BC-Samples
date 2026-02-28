namespace dvlprlife.samples.stream1;

page 50190 "DVLPR Stream Samples Card"
{
    Caption = 'Stream Samples';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "DVLPR Stream Demo";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Stream Samples';
                label(Instructions)
                {
                    Caption = 'Use the actions to run samples that demonstrate InStream and OutStream usage in AL.';
                }
            }
            group(BlobStorage)
            {
                Caption = 'BLOB Storage';

                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'The auto-incremented entry number.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'A description for this record.';
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'The name of the file stored in the BLOB field.';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            // #region InStream and OutStream Basics
            group(Basics)
            {
                Caption = 'InStream and OutStream Basics';

                action(InStreamOutStreamDemo)
                {
                    Caption = 'InStream / OutStream Demo';
                    ToolTip = 'Writes text into a BLOB using OutStream and reads it back using InStream.';
                    Image = Text;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        StreamSamples.InStreamOutStreamDemo();
                    end;
                }
            }

            // #region File Upload with InStream
            group(FileUpload)
            {
                Caption = 'File Upload with InStream';

                action(ImportTextFile)
                {
                    Caption = 'Import Text File';
                    ToolTip = 'Prompts the user to upload a text file and reads its contents line by line.';
                    Image = Import;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        StreamSamples.ImportTextFile();
                    end;
                }
            }

            // #region Import and Export with BLOB Fields
            group(BlobImportExport)
            {
                Caption = 'Import and Export with BLOB Fields';

                action(ImportFileToBlobField)
                {
                    Caption = 'Import File to BLOB';
                    ToolTip = 'Uploads a file and stores it in the BLOB field on the current record.';
                    Image = Import;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        StreamSamples.ImportFileToBlobField(Rec);
                        CurrPage.Update(false);
                    end;
                }
                action(ExportBlobFieldToFile)
                {
                    Caption = 'Export BLOB to File';
                    ToolTip = 'Downloads the file stored in the BLOB field back to the user.';
                    Image = Export;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        StreamSamples.ExportBlobFieldToFile(Rec);
                    end;
                }
            }

            // #region Multi-Line OutStream Writing
            group(MultiLine)
            {
                Caption = 'Multi-Line Writing';

                action(WriteMultipleLines)
                {
                    Caption = 'Write Multiple Lines';
                    ToolTip = 'Writes multiple lines into a TempBlob using OutStream and reads them back with InStream.';
                    Image = LineDescription;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        StreamSamples.WriteMultipleLines();
                    end;
                }
            }

            // #region CopyStream Between TempBlobs
            group(CopyStreamGroup)
            {
                Caption = 'CopyStream';

                action(CopyStreamDemo)
                {
                    Caption = 'CopyStream Demo';
                    ToolTip = 'Pipes data from one TempBlob to another using CopyStream without manual looping.';
                    Image = Copy;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        StreamSamples.CopyStreamDemo();
                    end;
                }
            }
        }
    }

    var
        StreamSamples: Codeunit "DVLPR Stream Samples";
}
