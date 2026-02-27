namespace dvlprlife.samples.typehelper1;

page 50180 "DVLPR Type Helper Samples Card"
{
    Caption = 'Type Helper Samples';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Type Helper Samples';
                label(Instructions)
                {
                    Caption = 'Use the actions to run samples that demonstrate the Type Helper codeunit.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            // #region String Utilities
            group(StringUtilities)
            {
                Caption = 'String Utilities';

                action(IsNumeric)
                {
                    Caption = 'IsNumeric';
                    ToolTip = 'Returns true if a text value can be parsed as a Decimal.';
                    Image = Text;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.IsNumericSample();
                    end;
                }
                action(IsPhoneNumber)
                {
                    Caption = 'IsPhoneNumber';
                    ToolTip = 'Validates that a string contains only digits, spaces, parentheses, dashes, and +.';
                    Image = Calls;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.IsPhoneNumberSample();
                    end;
                }
                action(CharacterChecks)
                {
                    Caption = 'Character Checks';
                    ToolTip = 'IsLatinLetter / IsDigit / IsUpper: Character-level checks.';
                    Image = Find;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.CharacterChecksSample();
                    end;
                }
                action(TextDistance)
                {
                    Caption = 'TextDistance';
                    ToolTip = 'Calculates the Levenshtein distance between two strings.';
                    Image = CalculateLines;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.TextDistanceSample();
                    end;
                }
                action(LineSeparator)
                {
                    Caption = 'Line Separator';
                    ToolTip = 'NewLine / CRLFSeparator / LFSeparator: Returns line separator strings.';
                    Image = LineDescription;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.LineSeparatorSample();
                    end;
                }
            }

            // #region Date and Time
            group(DateAndTime)
            {
                Caption = 'Date and Time';

                action(FormatDateWithCurrentCulture)
                {
                    Caption = 'FormatDate (Current Culture)';
                    ToolTip = 'Formats a Date using the current user''s locale.';
                    Image = Calendar;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.FormatDateWithCurrentCultureSample();
                    end;
                }
                action(FormatDate)
                {
                    Caption = 'FormatDate';
                    ToolTip = 'Format with a specific language ID or a custom format string and culture.';
                    Image = Calendar;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.FormatDateSample();
                    end;
                }
                action(CompareDateTime)
                {
                    Caption = 'CompareDateTime';
                    ToolTip = 'Compares two DateTime values with millisecond-level tolerance.';
                    Image = CompareCost;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.CompareDateTimeSample();
                    end;
                }
                action(AddHoursToDateTime)
                {
                    Caption = 'AddHoursToDateTime';
                    ToolTip = 'Adds a number of hours to a DateTime value.';
                    Image = Timeline;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.AddHoursToDateTimeSample();
                    end;
                }
                action(GetHMSFromTime)
                {
                    Caption = 'GetHMSFromTime';
                    ToolTip = 'Breaks a Time value into hour, minute, and second components.';
                    Image = Holiday;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.GetHMSFromTimeSample();
                    end;
                }
                action(EvaluateUnixTimestamp)
                {
                    Caption = 'EvaluateUnixTimestamp';
                    ToolTip = 'Converts a Unix epoch timestamp to a DateTime.';
                    Image = Calendar;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.EvaluateUnixTimestampSample();
                    end;
                }
                action(GetCurrentUTCDateTime)
                {
                    Caption = 'Get Current UTC DateTime';
                    ToolTip = 'GetCurrUTCDateTime / GetCurrUTCDateTimeAsText / GetCurrUTCDateTimeISO8601.';
                    Image = UnitConversions;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.GetCurrentUTCDateTimeSamples();
                    end;
                }
            }

            // #region Timezone Conversions
            group(TimezoneConversions)
            {
                Caption = 'Timezone Conversions';

                action(GetUserTimezoneOffset)
                {
                    Caption = 'GetUserTimezoneOffset';
                    ToolTip = 'Returns the current user''s UTC offset as a Duration.';
                    Image = BreakRulesOff;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.GetUserTimezoneOffsetSample();
                    end;
                }
            }

            // #region Type Conversion and Formatting
            group(TypeConversionAndFormatting)
            {
                Caption = 'Type Conversion and Formatting';

                action(Evaluate)
                {
                    Caption = 'Evaluate';
                    ToolTip = 'General-purpose type evaluator. Parses text into a target type using format and culture.';
                    Image = ChangeStatus;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.EvaluateSample();
                    end;
                }
                action(FormatDecimal)
                {
                    Caption = 'FormatDecimal';
                    ToolTip = 'Formats a Decimal with a .NET format string and culture name.';
                    Image = NumberGroup;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.FormatDecimalSample();
                    end;
                }
                action(IntToHex)
                {
                    Caption = 'IntToHex';
                    ToolTip = 'Converts an integer to its hexadecimal representation.';
                    Image = NumberGroup;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.IntToHexSample();
                    end;
                }
                action(MaximumMinimum)
                {
                    Caption = 'Maximum / Minimum';
                    ToolTip = 'Returns the larger or smaller of two Decimal values.';
                    Image = CalculateLines;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.MaximumMinimumSample();
                    end;
                }
            }

            // #region Web and URL Encoding
            group(WebAndURLEncoding)
            {
                Caption = 'Web and URL Encoding';

                action(UrlEncode)
                {
                    Caption = 'UrlEncode / UrlDecode';
                    ToolTip = 'Encodes/decodes a text value for use in URLs.';
                    Image = Web;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.UrlEncodeSample();
                    end;
                }
                action(HtmlEncode)
                {
                    Caption = 'HtmlEncode / HtmlDecode';
                    ToolTip = 'Encodes/decodes characters for safe HTML output.';
                    Image = Web;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.HtmlEncodeSample();
                    end;
                }
                action(UriHelpers)
                {
                    Caption = 'UriEscape / UriGetAuthority';
                    ToolTip = 'RFC 3986 percent-encoding and authority extraction.';
                    Image = Web;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.UriHelpersSample();
                    end;
                }
            }

            // #region Option Field Helpers
            group(OptionFieldHelpers)
            {
                Caption = 'Option Field Helpers';

                action(GetOptionNo)
                {
                    Caption = 'GetOptionNo';
                    ToolTip = 'Looks up the integer index of an option value within an option string.';
                    Image = Find;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.GetOptionNoSample();
                    end;
                }
                action(GetNumberOfOptions)
                {
                    Caption = 'GetNumberOfOptions';
                    ToolTip = 'Counts commas in an option string (returns n-1 for n options).';
                    Image = NumberGroup;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.GetNumberOfOptionsSample();
                    end;
                }
            }

            // #region Record and Field Reflection
            group(RecordAndFieldReflection)
            {
                Caption = 'Record and Field Reflection';

                action(GetField)
                {
                    Caption = 'GetField / GetFieldLength';
                    ToolTip = 'Retrieves field metadata and declared text field length.';
                    Image = Find;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.GetFieldSample();
                    end;
                }
                action(SortRecordRef)
                {
                    Caption = 'SortRecordRef';
                    ToolTip = 'Applies a sort order to a RecordRef using a comma-separated list of field names.';
                    Image = SortAscending;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.SortRecordRefSample();
                    end;
                }
                action(GetKeyAsString)
                {
                    Caption = 'GetKeyAsString';
                    ToolTip = 'Returns the key fields of a record as a comma-separated string.';
                    Image = Text;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.GetKeyAsStringSample();
                    end;
                }
            }

            // #region Stream Reading
            group(StreamReading)
            {
                Caption = 'Stream Reading';

                action(ReadAsTextWithSeparator)
                {
                    Caption = 'ReadAsTextWithSeparator';
                    ToolTip = 'Reads an InStream into a Text value using a specified line separator.';
                    Image = Import;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.ReadAsTextWithSeparatorSample();
                    end;
                }
            }

            // #region Amount and Currency Formatting
            group(AmountAndCurrencyFormatting)
            {
                Caption = 'Amount and Currency Formatting';

                action(GetAmountFormatLCY)
                {
                    Caption = 'GetAmountFormatLCY';
                    ToolTip = 'Returns a BC format string for displaying amounts in the local currency.';
                    Image = Currency;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.GetAmountFormatLCYSample();
                    end;
                }
                action(XMLFormats)
                {
                    Caption = 'XML Formats';
                    ToolTip = 'Returns BC format strings suitable for XML output.';
                    Image = XMLFile;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TypeHelperSamples.XMLFormatsSample();
                    end;
                }
            }
        }
    }

    var
        TypeHelperSamples: Codeunit "DVLPR Type Helper Samples";
}
