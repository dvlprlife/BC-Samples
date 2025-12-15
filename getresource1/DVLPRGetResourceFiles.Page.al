namespace dvlprlife.getresource1.getresource;
page 50122 "DVLPR GetResource Files"
{
    Caption = 'GetResource Files';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Info)
            {
                Caption = 'Resource Names';

                field(Resources; this.AllResourceNames)
                {
                    Caption = 'Resource Names';
                    ApplicationArea = All;
                    Editable = false;
                    MultiLine = true;
                    Tooltip = 'A text list of all the resources loaded in the package.';
                }

                field(ImageResources; this.ImageResourceNames)
                {
                    Caption = 'Image Resource Names';
                    ApplicationArea = All;
                    Editable = false;
                    MultiLine = true;
                    Tooltip = 'A text list of all the image resources loaded in the package.';
                }
            }
            group(GetResourceAsJson)
            {
                Caption = 'GetResourceAsJson';

                field(JSONFile; this.JSONText)
                {
                    Caption = 'JSON file';
                    ApplicationArea = All;
                    Editable = false;
                    MultiLine = true;
                    Tooltip = 'Displays the content of the resource JSON file.';
                }
            }
            group(GetResourceAsText)
            {
                Caption = 'GetResourceAsText';

                field(TextFile; this.SampleText)
                {
                    Caption = 'Text file';
                    ApplicationArea = All;
                    Editable = false;
                    MultiLine = true;
                    Tooltip = 'Displays the content of the resource text file.';
                }
            }
        }
    }

    var
        JSONText: Text;
        SampleText: Text;
        AllResourceNames: Text;
        ImageResourceNames: Text;
        ResourceJSONFileLbl: Label 'json/items.json';
        ResourceTextFileLbl: Label 'text/sample.txt';

    trigger OnOpenPage()
    begin
        this.JSONText := this.LoadJSON(this.ResourceJSONFileLbl);
        this.SampleText := this.LoadText(this.ResourceTextFileLbl);
        this.AllResourceNames := this.ResourceTextList('');
        this.ImageResourceNames := this.ResourceTextList('images');
    end;

    local procedure LoadJSON(resource: text): Text
    var
        ResourceJson: JsonObject;
        JSON: Text;
    begin
        ResourceJson := NavApp.GetResourceAsJson(resource, TextEncoding::UTF8);
        ResourceJson.WriteTo(JSON);
        exit(JSON);
    end;

    local procedure LoadText(resource: text): Text
    begin
        exit(NavApp.GetResourceAsText(resource, TextEncoding::UTF8));
    end;

    local procedure ResourceTextList(filter: Text): Text
    var
        ResourceList: List of [Text];
        ResourceNames: Text;
        resourceIndex: Integer;
    begin
        ResourceList := NavApp.ListResources(filter);
        for resourceIndex := 1 to ResourceList.Count() do
            ResourceNames := resourceIndex = ResourceList.Count() ? ResourceNames + ' ' + ResourceList.Get(resourceIndex) : ResourceNames + ' ' + ResourceList.Get(resourceIndex) + '\';

        exit(ResourceNames);
    end;
}
