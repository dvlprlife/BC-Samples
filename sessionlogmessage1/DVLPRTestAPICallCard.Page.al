namespace dvlprlife.samples.sessionlogmessage1;

page 50170 "DVLPR Test API Call Card"
{
    ApplicationArea = All;
    Caption = 'Test API Call';
    PageType = Card;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'API Settings';

                field(EndpointField; Endpoint)
                {
                    Caption = 'Endpoint URL';
                    ToolTip = 'Enter the URL of the external API to call.';
                }
            }
            group(Results)
            {
                Caption = 'Results';

                field(ResultField; ResultText)
                {
                    Caption = 'Result';
                    Editable = false;
                    Style = Favorable;
                    StyleExpr = IsSuccess;
                    ToolTip = 'Shows the result of the API call.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CallAPI)
            {
                Caption = 'Call External API';
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Calls the external API using the specified endpoint.';

                trigger OnAction()
                var
                    SessionLogMessage: Codeunit "DVLPR Session Log Message";
                begin
                    if Endpoint = '' then
                        Error(EndpointMissingErr);

                    IsSuccess := SessionLogMessage.CallExternalApi(Endpoint);

                    if IsSuccess then
                        ResultText := SuccessTxt
                    else
                        ResultText := FailureTxt;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Endpoint := 'https://jsonplaceholder.typicode.com/posts/1';
    end;

    var
        IsSuccess: Boolean;
        EndpointMissingErr: Label 'Please enter an endpoint URL.';
        FailureTxt: Label 'API call failed.';
        SuccessTxt: Label 'API call succeeded.';
        Endpoint: Text;
        ResultText: Text;
}
