namespace dvlprlife.samples.xmlreader1;

using System.Utilities;

page 50201 "DVLPR XML Reader Card"
{
    Caption = 'XML Reader Samples';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'XML Reader Samples';
                label(Instructions)
                {
                    Caption = 'Use the actions to import and parse an XML file using XmlDocument, XmlElement, and related AL XML types.';
                }
            }
            group(Results)
            {
                Caption = 'Output';
                field(OutputText; this.OutputText)
                {
                    Caption = 'Parsed Output';
                    ApplicationArea = All;
                    Editable = false;
                    MultiLine = true;
                    ToolTip = 'Displays the parsed output from the imported XML file.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(ImportActions)
            {
                Caption = 'Import XML';

                action(ImportXmlFile)
                {
                    Caption = 'Import XML File';
                    ToolTip = 'Upload an XML file and parse its sales order content.';
                    ApplicationArea = All;
                    Image = Import;

                    trigger OnAction()
                    begin
                        this.ImportAndParseXmlFile();
                    end;
                }
                action(LoadSampleXml)
                {
                    Caption = 'Load Sample XML';
                    ToolTip = 'Load the embedded sample SalesOrder.xml resource and parse it.';
                    ApplicationArea = All;
                    Image = XMLFile;

                    trigger OnAction()
                    begin
                        this.LoadAndParseSampleXml();
                    end;
                }
            }
        }
    }

    var
        OutputText: Text;

    local procedure ImportAndParseXmlFile()
    var
        XmlReaderSamples: Codeunit "DVLPR XML Reader Samples";
        OutputLines: List of [Text];
        InStr: InStream;
        FileName: Text;
    begin
        if not UploadIntoStream('Select an XML file', '', 'XML Files (*.xml)|*.xml', FileName, InStr) then
            exit;

        XmlReaderSamples.ReadSalesOrderFromStream(InStr, OutputLines);
        this.OutputText := this.JoinLines(OutputLines);
    end;

    local procedure LoadAndParseSampleXml()
    var
        XmlReaderSamples: Codeunit "DVLPR XML Reader Samples";
        OutputLines: List of [Text];
        ResInStream: InStream;
        XmlText: Text;
    begin
        NavApp.GetResource('xml/SalesOrder.xml', ResInStream, TextEncoding::UTF8);
        ResInStream.Read(XmlText);
        XmlReaderSamples.ReadSalesOrderXml(XmlText, OutputLines);
        this.OutputText := this.JoinLines(OutputLines);
    end;

    local procedure JoinLines(Lines: List of [Text]) Result: Text
    var
        Line: Text;
        CrLf: Text[2];
    begin
        CrLf[1] := 13;
        CrLf[2] := 10;
        foreach Line in Lines do begin
            if Result <> '' then
                Result += CrLf;
            Result += Line;
        end;
    end;
}
