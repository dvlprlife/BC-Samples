namespace dvlprlife.samples.xmlreader1;

codeunit 50200 "DVLPR XML Reader Samples"
{
    procedure ReadSalesOrderXml(XmlText: Text; var OutputLines: List of [Text])
    var
        XmlDoc: XmlDocument;
    begin
        if not XmlDocument.ReadFrom(XmlText, XmlDoc) then
            Error('Failed to parse XML document.');

        this.ProcessSalesOrder(XmlDoc, OutputLines);
    end;

    procedure ReadSalesOrderFromStream(XmlStream: InStream; var OutputLines: List of [Text])
    var
        XmlDoc: XmlDocument;
    begin
        XmlDocument.ReadFrom(XmlStream, XmlDoc);
        this.ProcessSalesOrder(XmlDoc, OutputLines);
    end;

    local procedure ProcessSalesOrder(XmlDoc: XmlDocument; var OutputLines: List of [Text])
    var
        RootElement: XmlElement;
    begin
        XmlDoc.GetRoot(RootElement);
        this.ReadHeader(RootElement, OutputLines);
        this.ReadLines(RootElement, OutputLines);
    end;

    local procedure ReadHeader(RootElement: XmlElement; var OutputLines: List of [Text])
    var
        HeaderNode: XmlNode;
        HeaderElement: XmlElement;
        ChildNodes: XmlNodeList;
        ChildNode: XmlNode;
        ChildElement: XmlElement;
    begin
        if not RootElement.SelectSingleNode('Header', HeaderNode) then
            Error('Header element not found.');

        HeaderElement := HeaderNode.AsXmlElement();
        ChildNodes := HeaderElement.GetChildElements();

        OutputLines.Add('--- Header ---');
        foreach ChildNode in ChildNodes do begin
            ChildElement := ChildNode.AsXmlElement();
            OutputLines.Add(ChildElement.Name() + ': ' + ChildElement.InnerText());
        end;
    end;

    local procedure ReadLines(RootElement: XmlElement; var OutputLines: List of [Text])
    var
        LinesNode: XmlNode;
        LinesElement: XmlElement;
        LineNodeList: XmlNodeList;
        LineNode: XmlNode;
        LineElement: XmlElement;
        ChildNodes: XmlNodeList;
        ChildNode: XmlNode;
        ChildElement: XmlElement;
    begin
        if not RootElement.SelectSingleNode('Lines', LinesNode) then
            Error('Lines element not found.');

        LinesElement := LinesNode.AsXmlElement();
        LineNodeList := LinesElement.GetChildElements('Line');

        foreach LineNode in LineNodeList do begin
            LineElement := LineNode.AsXmlElement();
            ChildNodes := LineElement.GetChildElements();

            OutputLines.Add('--- Line ---');
            foreach ChildNode in ChildNodes do begin
                ChildElement := ChildNode.AsXmlElement();
                OutputLines.Add(ChildElement.Name() + ': ' + ChildElement.InnerText());
            end;
        end;
    end;
}
