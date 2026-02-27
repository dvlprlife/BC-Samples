namespace dvlprlife.samples.typehelper1;

using Microsoft.Sales.Customer;
using System.Reflection;
using System.Utilities;
codeunit 50180 "DVLPR Type Helper Samples"
{
    // Demonstrates the most useful procedures from the "Type Helper" Codeunit
    // (ID 10, namespace System.Reflection) in Business Central.

    #region String Utilities

    /// <summary>
    /// IsNumeric: Returns true if a text value can be parsed as a Decimal.
    /// </summary>
    procedure IsNumericSample()
    var
        TypeHelper: Codeunit "Type Helper";
        Result1,
        Result2 : Boolean;
        Value1,
        Value2 : Text;
    begin
        Value1 := '42.5';
        Value2 := 'hello';

        Result1 := TypeHelper.IsNumeric(Value1);   // true
        Result2 := TypeHelper.IsNumeric(Value2);  // false
        Message('IsNumeric(''' + Value1 + '''): %1\IsNumeric(''' + Value2 + '''): %2', Result1, Result2);
    end;

    /// <summary>
    /// IsPhoneNumber: Validates that a string contains only digits, spaces, parentheses, dashes, and +.
    /// </summary>
    procedure IsPhoneNumberSample()
    var
        TypeHelper: Codeunit "Type Helper";
        Value1,
        Value2 : Text;
    begin
        Value1 := '+1 (555) 123-4567';
        Value2 := 'not-a-phone';

        Message('IsPhoneNumber(''' + Value1 + '''): %1\IsPhoneNumber(''' + Value2 + '''): %2', TypeHelper.IsPhoneNumber(Value1), TypeHelper.IsPhoneNumber(Value2));
    end;

    /// <summary>
    /// IsLatinLetter / IsDigit / IsUpper: Character-level checks.
    /// </summary>
    procedure CharacterChecksSample()
    var
        TypeHelper: Codeunit "Type Helper";
        LetterChar: Char;
        DigitChar: Char;
    begin
        LetterChar := 'A';
        DigitChar := '3';

        if TypeHelper.IsLatinLetter(LetterChar) then
            Message('''A'' is a Latin letter.');

        if TypeHelper.IsDigit(DigitChar) then
            Message('''3'' is a digit.');

        if TypeHelper.IsUpper(LetterChar) then
            Message('''A'' is uppercase.');
    end;

    /// <summary>
    /// TextDistance: Calculates the Levenshtein distance between two strings.
    /// </summary>
    procedure TextDistanceSample()
    var
        TypeHelper: Codeunit "Type Helper";
        Distance: Integer;
    begin
        Distance := TypeHelper.TextDistance('Business', 'Busines');  // 1
        Message('TextDistance(''Business'', ''Busines''): %1', Distance);

        Distance := TypeHelper.TextDistance('Hello', 'World');       // 4
        Message('TextDistance(''Hello'', ''World''): %1', Distance);
    end;

    /// <summary>
    /// NewLine / CRLFSeparator / LFSeparator: Returns line separator strings.
    /// </summary>
    procedure LineSeparatorSample()
    var
        TypeHelper: Codeunit "Type Helper";
        Msg: Text;
    begin
        Msg := 'Line one' + TypeHelper.CRLFSeparator() + 'Line two';
        Message(Msg);
    end;

    #endregion

    #region Date and Time

    /// <summary>
    /// FormatDateWithCurrentCulture: Formats a Date using the current user's locale.
    /// </summary>
    procedure FormatDateWithCurrentCultureSample()
    var
        TypeHelper: Codeunit "Type Helper";
        FormattedDate: Text;
    begin
        FormattedDate := TypeHelper.FormatDateWithCurrentCulture(WorkDate());
        Message('FormatDateWithCurrentCulture: %1', FormattedDate);
    end;

    /// <summary>
    /// FormatDate overloads: Format with a specific language ID or a custom format string and culture.
    /// </summary>
    procedure FormatDateSample()
    var
        TypeHelper: Codeunit "Type Helper";
    begin
        // Format using a language ID (e.g., 1033 = en-US)
        Message('FormatDate (Language 1033): %1', TypeHelper.FormatDate(WorkDate(), 1033));

        // Format using a .NET format string and culture name
        Message('FormatDate (MMMM dd, yyyy / en-US): %1', TypeHelper.FormatDate(WorkDate(), 'MMMM dd, yyyy', 'en-US'));
    end;

    /// <summary>
    /// CompareDateTime: Compares two DateTime values with millisecond-level tolerance.
    /// Returns 1, 0, or -1.
    /// </summary>
    procedure CompareDateTimeSample()
    var
        TypeHelper: Codeunit "Type Helper";
        StartDateTime: DateTime;
        EndDateTime: DateTime;
        Result: Integer;
    begin
        StartDateTime := CreateDateTime(WorkDate(), 080000T);
        EndDateTime := CreateDateTime(WorkDate(), 170000T);

        Result := TypeHelper.CompareDateTime(StartDateTime, EndDateTime);
        Message('CompareDateTime result: %1 (negative means first is earlier)', Result);
    end;

    /// <summary>
    /// AddHoursToDateTime: Adds a number of hours to a DateTime value.
    /// </summary>
    procedure AddHoursToDateTimeSample()
    var
        TypeHelper: Codeunit "Type Helper";
        NewDT: DateTime;
    begin
        NewDT := TypeHelper.AddHoursToDateTime(CurrentDateTime, 8);
        Message('CurrentDateTime + 8 hours: %1', NewDT);
    end;

    /// <summary>
    /// GetHMSFromTime: Breaks a Time value into hour, minute, and second components.
    /// </summary>
    procedure GetHMSFromTimeSample()
    var
        TypeHelper: Codeunit "Type Helper";
        H: Integer;
        M: Integer;
        S: Integer;
        CurrentTime: Time;
    begin
        CurrentTime := Time;
        TypeHelper.GetHMSFromTime(H, M, S, CurrentTime);
        Message('Current time -> H:%1 M:%2 S:%3', H, M, S);
    end;

    /// <summary>
    /// EvaluateUnixTimestamp: Converts a Unix epoch timestamp to a DateTime.
    /// </summary>
    procedure EvaluateUnixTimestampSample()
    var
        TypeHelper: Codeunit "Type Helper";
        ResultDT: DateTime;
        TimeStamp: BigInteger;
    begin
        TimeStamp := 1740657600;
        ResultDT := TypeHelper.EvaluateUnixTimestamp(TimeStamp);
        Message('EvaluateUnixTimestamp(' + Format(TimeStamp, 9) + '): %1', ResultDT);
    end;

    /// <summary>
    /// GetCurrUTCDateTime / GetCurrUTCDateTimeAsText / GetCurrUTCDateTimeISO8601:
    /// Shortcuts for getting the current UTC time in different formats.
    /// </summary>
    procedure GetCurrentUTCDateTimeSamples()
    var
        TypeHelper: Codeunit "Type Helper";
        MyDT: DateTime;
        MyText: Text;
    begin
        // DateTime value
        MyDT := TypeHelper.GetCurrUTCDateTime();
        Message('GetCurrUTCDateTime: %1', MyDT);

        // RFC 1123 text: "Thu, 27 Feb 2026 14:30:00 GMT"
        MyText := TypeHelper.GetCurrUTCDateTimeAsText();
        Message('GetCurrUTCDateTimeAsText: %1', MyText);

        // ISO 8601: "2026-02-27T14:30:00Z"
        MyText := TypeHelper.GetCurrUTCDateTimeISO8601();
        Message('GetCurrUTCDateTimeISO8601: %1', MyText);
    end;

    #endregion

    #region Timezone Conversions

    /// <summary>
    /// GetUserTimezoneOffset: Returns the current user's UTC offset as a Duration.
    /// </summary>
    procedure GetUserTimezoneOffsetSample()
    var
        TypeHelper: Codeunit "Type Helper";
        Offset: Duration;
    begin
        if TypeHelper.GetUserTimezoneOffset(Offset) then
            Message('User timezone offset in ms: %1', Offset)
        else
            Message('User has no timezone set.');
    end;

    #endregion

    #region Type Conversion and Formatting

    /// <summary>
    /// Evaluate: General-purpose type evaluator. Parses text into a target type using format and culture.
    /// </summary>
    procedure EvaluateSample()
    var
        TypeHelper: Codeunit "Type Helper";
        Value: Variant;
        ParsedDate: Date;
        Ok: Boolean;
    begin
        ParsedDate := 0D;
        Value := ParsedDate;
        Ok := TypeHelper.Evaluate(Value, '02/27/2026', 'MM/dd/yyyy', 'en-US');
        if Ok then begin
            ParsedDate := Value;
            Message('Evaluate parsed date: %1', ParsedDate);
        end;
    end;

    /// <summary>
    /// FormatDecimal: Formats a Decimal with a .NET format string and culture name.
    /// </summary>
    procedure FormatDecimalSample()
    var
        TypeHelper: Codeunit "Type Helper";
        Formatted: Text;
    begin
        Formatted := TypeHelper.FormatDecimal(1234.56, 'N2', 'en-US');
        Message('FormatDecimal (en-US): %1', Formatted);  // "1,234.56"

        Formatted := TypeHelper.FormatDecimal(1234.56, 'N2', 'de-DE');
        Message('FormatDecimal (de-DE): %1', Formatted);  // "1.234,56"
    end;

    /// <summary>
    /// IntToHex: Converts an integer to its hexadecimal representation.
    /// </summary>
    procedure IntToHexSample()
    var
        TypeHelper: Codeunit "Type Helper";
    begin
        Message('IntToHex(255): %1', TypeHelper.IntToHex(255));    // "FF"
        Message('IntToHex(4096): %1', TypeHelper.IntToHex(4096));  // "1000"
    end;

    /// <summary>
    /// Maximum / Minimum: Returns the larger or smaller of two Decimal values.
    /// </summary>
    procedure MaximumMinimumSample()
    var
        TypeHelper: Codeunit "Type Helper";
    begin
        Message('Maximum(10.0, 25.5): %1', TypeHelper.Maximum(10.0, 25.5));  // 25.5
        Message('Minimum(10.0, 25.5): %1', TypeHelper.Minimum(10.0, 25.5));  // 10
    end;

    #endregion

    #region Web and URL Encoding

    /// <summary>
    /// UrlEncode / UrlDecode: Encodes/decodes a text value for use in URLs.
    /// </summary>
    procedure UrlEncodeSample()
    var
        TypeHelper: Codeunit "Type Helper";
        Encoded: Text;
    begin
        Encoded := 'search term with spaces';
        TypeHelper.UrlEncode(Encoded);
        Message('UrlEncode: %1', Encoded);  // "search+term+with+spaces"

        TypeHelper.UrlDecode(Encoded);
        Message('UrlDecode: %1', Encoded);  // "search term with spaces"
    end;

    /// <summary>
    /// HtmlEncode / HtmlDecode: Encodes/decodes characters for safe HTML output.
    /// </summary>
    procedure HtmlEncodeSample()
    var
        TypeHelper: Codeunit "Type Helper";
        SafeHtml: Text;
    begin
        SafeHtml := '<script>alert("xss")</script>';
        TypeHelper.HtmlEncode(SafeHtml);
        Message('HtmlEncode: %1', SafeHtml);
        // "&lt;script&gt;alert(&quot;xss&quot;)&lt;/script&gt;"

        TypeHelper.HtmlDecode(SafeHtml);
        Message('HtmlDecode: %1', SafeHtml);
        // '<script>alert("xss")</script>'
    end;

    /// <summary>
    /// UriEscapeDataString / UriGetAuthority: RFC 3986 percent-encoding and authority extraction.
    /// </summary>
    procedure UriHelpersSample()
    var
        TypeHelper: Codeunit "Type Helper";
    begin
        Message('UriEscapeDataString: %1', TypeHelper.UriEscapeDataString('hello world'));
        // "hello%20world"

        Message('UriGetAuthority: %1', TypeHelper.UriGetAuthority('https://api.example.com/v1/items'));
        // "https://api.example.com"
    end;

    #endregion

    #region Option Field Helpers

    /// <summary>
    /// GetOptionNo: Looks up the integer index of an option value within an option string.
    /// </summary>
    procedure GetOptionNoSample()
    var
        TypeHelper: Codeunit "Type Helper";
        Idx: Integer;
    begin
        Idx := TypeHelper.GetOptionNo('Posted', 'Open,Released,Posted,Canceled');
        Message('GetOptionNo(''Posted''): %1', Idx);  // 2
    end;

    /// <summary>
    /// GetNumberOfOptions: Counts commas in an option string (returns n-1 for n options).
    /// </summary>
    procedure GetNumberOfOptionsSample()
    var
        TypeHelper: Codeunit "Type Helper";
    begin
        Message('GetNumberOfOptions: %1', TypeHelper.GetNumberOfOptions('Open,Released,Posted'));
        // 2 (counts commas)
    end;

    #endregion

    #region Record and Field Reflection

    /// <summary>
    /// GetField / GetFieldLength: Retrieves field metadata and declared text field length.
    /// </summary>
    procedure GetFieldSample()
    var
        FieldRec: Record Field;
        Customer: Record Customer;
        TypeHelper: Codeunit "Type Helper";
    begin
        if TypeHelper.GetField(Database::Customer, Customer.FieldNo(Name), FieldRec) then
            Message('Customer Name field - Max length: %1', TypeHelper.GetFieldLength(Database::Customer, Customer.FieldNo(Name)));
    end;

    /// <summary>
    /// SortRecordRef: Applies a sort order to a RecordRef using a comma-separated list of field names.
    /// </summary>
    procedure SortRecordRefSample()
    var
        TypeHelper: Codeunit "Type Helper";
        RecRef: RecordRef;
    begin
        RecRef.Open(Database::Customer);
        TypeHelper.SortRecordRef(RecRef, '"No."', true);  // ascending by No.
        if RecRef.FindSet() then
            repeat
                Message('Customer: %1', RecRef.Field(1).Value);
            until RecRef.Next() = 0;
        RecRef.Close();
    end;

    /// <summary>
    /// GetKeyAsString: Returns the key fields of a record as a comma-separated string.
    /// </summary>
    procedure GetKeyAsStringSample()
    var
        Cust: Record Customer;
        TypeHelper: Codeunit "Type Helper";
        KeyText: Text;
    begin
        if Cust.FindFirst() then begin
            KeyText := TypeHelper.GetKeyAsString(Cust, 1);
            Message('GetKeyAsString: %1', KeyText);
        end;
    end;

    #endregion

    #region Stream Reading

    /// <summary>
    /// ReadAsTextWithSeparator: Reads an InStream into a Text value using a specified line separator.
    /// TryReadAsTextWithSeparator wraps the call in a TryFunction for error-safe reading.
    /// </summary>
    procedure ReadAsTextWithSeparatorSample()
    var
        TempBlob: Codeunit "Temp Blob";
        TypeHelper: Codeunit "Type Helper";
        FileContent: Text;
        IStream: InStream;
        OStream: OutStream;
    begin
        // Create a sample blob with some text
        TempBlob.CreateOutStream(OStream);
        OStream.WriteText('Line 1');
        OStream.WriteText(TypeHelper.CRLFSeparator());
        OStream.WriteText('Line 2');
        OStream.WriteText(TypeHelper.CRLFSeparator());
        OStream.WriteText('Line 3');

        TempBlob.CreateInStream(IStream);
        FileContent := TypeHelper.ReadAsTextWithSeparator(IStream, TypeHelper.CRLFSeparator());
        Message('ReadAsTextWithSeparator:\%1', FileContent);
    end;

    #endregion

    #region Amount and Currency Formatting

    /// <summary>
    /// GetAmountFormatLCYWithUserLocale: Returns a BC format string for displaying amounts
    /// in the local currency, formatted for the current user's locale.
    /// </summary>
    procedure GetAmountFormatLCYSample()
    var
        TypeHelper: Codeunit "Type Helper";
        AmtFormat: Text;
    begin
        AmtFormat := TypeHelper.GetAmountFormatLCYWithUserLocale();
        Message('Formatted amount: %1', Format(1234.56, 0, AmtFormat));
    end;

    /// <summary>
    /// GetXMLAmountFormatWithTwoDecimalPlaces / GetXMLDateFormat:
    /// Returns BC format strings suitable for XML output.
    /// </summary>
    procedure XMLFormatsSample()
    var
        TypeHelper: Codeunit "Type Helper";
    begin
        Message('XML Date: %1', Format(Today, 0, TypeHelper.GetXMLDateFormat()));
        // e.g., "2026-02-27"

        Message('XML Amount: %1', Format(12345.6, 0, TypeHelper.GetXMLAmountFormatWithTwoDecimalPlaces()));
        // "12345.60"
    end;

    #endregion
}
