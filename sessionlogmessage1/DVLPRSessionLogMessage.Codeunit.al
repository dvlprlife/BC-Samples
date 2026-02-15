namespace dvlprlife.samples.sessionlogmessage1;

codeunit 50170 "DVLPR Session Log Message"
{
    procedure CallExternalApi(Endpoint: Text): Boolean
    var
        Success: Boolean;
        Dimensions: Dictionary of [Text, Text];
        Client: HttpClient;
        Response: HttpResponseMessage;
    begin
        Success := Client.Get(Endpoint, Response);

        Dimensions.Add('Endpoint', Endpoint);
        Dimensions.Add('HttpStatusCode', Format(Response.HttpStatusCode()));
        Dimensions.Add('Success', Format(Success and Response.IsSuccessStatusCode()));

        if Success and Response.IsSuccessStatusCode() then begin
            LogMessage(
                'DVLPR-1001',
                'External API called successfully',
                Verbosity::Normal,
                DataClassification::SystemMetadata,
                TelemetryScope::ExtensionPublisher,
                Dimensions
            );
            exit(true);
        end;

        LogMessage(
            'DVLPR-1002',
            'External API call failed',
            Verbosity::Error,
            DataClassification::SystemMetadata,
            TelemetryScope::All,
            Dimensions
        );
        exit(false);
    end;
}